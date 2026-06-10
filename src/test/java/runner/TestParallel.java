package runner;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class TestParallel {

    @Test
    void testParallel() {
        Results results = Runner
            .path("classpath:features")
            .tags("@regression")
            .parallel(5);

        assertEquals(0, results.getFailCount(),
            results.getErrorMessages());
    }

    @Test
    void testSmoke() {
        Results results = Runner
            .path("classpath:features")
            .tags("@smoke")
            .parallel(2);

        assertEquals(0, results.getFailCount(),
            results.getErrorMessages());
    }
}
