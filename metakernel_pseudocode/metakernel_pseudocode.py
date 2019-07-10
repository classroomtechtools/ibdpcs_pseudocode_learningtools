from metakernel import MetaKernel
from ib_pseudocode_python.cli import Transpiler

import sys
from io import StringIO


class PseudocodeKernel(MetaKernel):
    implementation = 'IB_Pseudocode Python'
    implementation_version = '0.7'
    language_version = '0.1'
    language_info = {'name': 'pseudocode_python', 'file_extension': '.pseudo', 'mimetype': 'text/x-python'}
    banner = "IB PseudoCode kernel - tranpiles to Python and executes"
    transpiler = Transpiler()

    kernel_json = {
        'argv': [
            sys.executable, '-m', 'metakernel_pseudocode', '-f', '{connection_file}'],
        'display_name': 'IB Pseudocode Python',
        'language': 'python',
        'name': 'metakernel_pseudocode'
    }

    def __init__(self, *args, **kwargs):
        self.out_magic = None
        super().__init__(*args, **kwargs)

    def do_execute(self, code, *args, **kwargs):
        kwargs['silent'] = True
        return super().do_execute(code, **kwargs)

    def do_execute_direct(self, code):
        pseudo_code_stream = StringIO(code)
        pseudocode, code = self.transpiler.transpile(pseudo_code_stream)
        result, error = self.transpiler.execute_and_capture(code, pseudocode)
        result = result.strip().split('\n')
        if error:
            # Output the non-error part to stout, and output the error part to sterr
            if len(result) > 4:
                self.Print('\n'.join(result[:len(result)-4]))
                self.Error('\n'.join(result[len(result)-4:]))
            else:
                self.Error('\n'.join(result))
        else:
            # Output whatever we got in stout as the output cell
            message = {"metadata": {}, "data": {'text/plain': '\n'.join(result)}, "execution_count": self.execution_count}
            self.send_response(self.iopub_socket, 'execute_result', message)

        return {'status': 'ok',
                'execution_count': self.execution_count,
                'payload': [],
                'user_expressions': {},
               }


if __name__ == "__main__":

    PseudocodeKernel.run_as_main()
