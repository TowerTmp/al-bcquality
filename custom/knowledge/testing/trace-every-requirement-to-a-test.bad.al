// FR-7 exists but no test asserts it; this only checks an incidental field.
[Test]
procedure CustomerHasCreditLimitField()
begin
    Assert.AreEqual(1000, Customer."Credit Limit (LCY)", 'limit value');
    // nothing verifies that posting is actually blocked over the limit
end;
