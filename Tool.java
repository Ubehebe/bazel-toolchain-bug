import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

class Tool {
    public static void main(String[] args) throws IOException {
        Files.write(Path.of(args[0]), "hello from the tool\n".getBytes());
    }
}
