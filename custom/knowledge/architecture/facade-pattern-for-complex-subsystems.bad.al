// Every caller re-implements the whole sequence and couples to all the internals.
RebateSetup.Get();
if not RebateMgt.IsEligible(Customer."No.") then
    Error(NotEligibleErr);
Amount := RebateCalc.Compute(Customer."No.", RebateSetup."Base %");
RebatePost.Post(Customer."No.", Amount);
// ...and the same four steps appear again in three other codeunits.
