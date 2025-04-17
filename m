Return-Path: <linux-input+bounces-11825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD614A91EB2
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 15:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B92F8A11F6
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0077A24EA92;
	Thu, 17 Apr 2025 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GldvO/F3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4004A24E00A;
	Thu, 17 Apr 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897909; cv=none; b=XaxKqO+1/NLedPsNLmkiFGb0IIfxlXBeJUfs19wj16vh9qSnytS/d65p0kPlqGG7sPZez7T0SmdLeO59PBcFTjd4kIaMXMFnj/dBCA404+hqJRxsxMsVF09zp5XydZ27RG4o/4qJgzBRIOyvWf1pHwPT1lxrPJKjvfO/YIG5FEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897909; c=relaxed/simple;
	bh=kvDzvFLykr8zaiqq2xGfd9BwL+jtTVVfZKHIilgYdb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UM5xbSsW2WOSN/ByRvCbONR9BdgUAp19HrWMyvQNTrz3bC1cJQf0NRSHx0Ih1puCNCMp1LhZWIv346h+xtXxexCxsgJYtguMN4yAl5UkAIV6BpkhY7t2R29jTMqpsK47XepISS8zVXRy/ZFBBabY1GyyouSupmGy4naxnCGrBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GldvO/F3; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744897843;
	bh=Ns6Wz60bvg65EUaf96SxqpbEI3mWfKuVkE4GOkJviJg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GldvO/F36l6xO24szOvfSfNy9tPpqStJNQmuoZsAxxaPZ1JUePMyIX/ESAcDtrYdU
	 FOQGFMA+RiFR9Pls0CiCuVR82RqShU6IaejVGhWcsfvw1t/kTkcOoeMsfmtOiRLVbV
	 aTmGJsS3rzVnYXEhhAeMZiqwhuThlu/8o+C9j1/w=
X-QQ-mid: zesmtpip3t1744897830tbf94db9b
X-QQ-Originating-IP: Ioc86VluU8HiyFet5Pq+rt4In2cPZ1QrjoazMmwPlL4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Apr 2025 21:50:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14252534519279305629
EX-QQ-RecipientCnt: 13
From: WangYuli <wangyuli@uniontech.com>
To: even.xu@intel.com,
	xinpeng.sun@intel.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: mpearson-lenovo@squebb.ca,
	srinivas.pandruvada@linux.intel.com,
	guanwentao@uniontech.com,
	phasta@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] HID: intel-thc-hid: intel-quicki2c: pass correct arguments to acpi_evaluate_object
Date: Thu, 17 Apr 2025 21:50:23 +0800
Message-ID: <DA446911D078F45A+20250417135023.543707-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NnvXaJ5yySl8yLYlWckH/4W0jvQ20VLgPRTgTbRtPfX+PhALBf3qUW5b
	EbaC+N9jz+b4dkhwUeiCaIMDyuE6m4KegSeyINwEW9y6s07dChQAlWK/W9axxcaIsNi/qbc
	Sr//EfRp22hTWiodD2NGC7KVoHykpZeJqmTjKLAtcpGy98Jv4fuB03djHtx/P1E+pDfOfKZ
	jSyBV+F9fhOnwLDlww4l4v+DVCCXDnX7lgnp1Fu7PBYf9JujtbFFt0xdC8Ev0bQuehlYQ96
	l6gBtUaKuiPqMeKCAKy2tzrfBwIVcDuZVwvplNMvnIDStGP7wL+O03KSjmxes5YyGGQPL9z
	puunYdrhtkxUtNCNYmIViq+EziTV9NiKTFKB0O98U4kIKeIQn8uhKnk7YUiYZTrJdY4G2ct
	c7IdaRFWJGg9OpTLN1IN3gjL6UjeC5lzWrZCEi9yHG+oH7rh5dBwTWrytZVYTJgTvAiJa4J
	OVfXP7lFUmpgOq0M/hBbYsgggamGErU97d5ClfawwxVXu8QUy1EhS8R/ouqYdJ4Tdzx8Kgo
	/zCm4UCLo8mRPVqCOaGV50y3xyXsRli5NlcrZ0taMiA0URTDGm6DtW2T1vGQU4KXmKcCGbf
	dr+nF4RLESlxOGGYi3CQJuwAiiPGNmrphjKpePAuso3Zu6hz1nZ5R6Q5yB0zrnBLzND9wZC
	m54t4BdAsc/eGlX9+ZMfi1ff4aEEVv7CxgGFfpJYFvThk5oSDk7wZQh8mRZrlrbTlFL0MOx
	Q4deUUhbRzyRVL79rniPqq3ulO1px40yu5vKAf4hgao1YBBqerQohH9EdZOyAE8iRfAQZrr
	eRL7VWlydto94dp3Pbl8GKzXTynRcz6E+mlxbRTueClL15FfGFba3cGjrrkKxeZURhzuLmk
	5v57d6RnlASWhjuE5vEYo0rWmpvW3OlxRqO3Zp8wPoFwpleJJh4QFpGebax7sB80mHKDPvW
	w8Pwiy/cQ8LBpyXC01RgomXjwHgmfOFh9wOTpqW79GBugrm0+IgkRtwrDRFEUoGA5+DmEmU
	NGfg/gQZCN5FqjAz4tGxuI3WmzWLwxCOr4Abxu20Zyu5KFIm2W
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

From: Wentao Guan <guanwentao@uniontech.com>

Delete unused argument, pass correct argument to acpi_evaluate_object.

Log:
  intel_quicki2c 0000:00:10.0: enabling device (0000 -> 0002)
  ACPI: \_SB.PC00.THC0.ICRS: 1 arguments were passed to a non-method ACPI object (Buffer) (20230628/nsarguments-211)
  ACPI: \_SB.PC00.THC0.ISUB: 1 arguments were passed to a non-method ACPI object (Buffer) (20230628/nsarguments-211)

Fixes: 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces")
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index fa51155ebe39..8a8c4a46f927 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -82,15 +82,10 @@ static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string
 {
 	acpi_handle handle = acpi_device_handle(adev);
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object obj = { .type = type };
-	struct acpi_object_list arg_list = {
-		.count = 1,
-		.pointer = &obj,
-	};
 	union acpi_object *ret_obj;
 	acpi_status status;
 
-	status = acpi_evaluate_object(handle, dsd_method_name, &arg_list, &buffer);
+	status = acpi_evaluate_object(handle, dsd_method_name, NULL, &buffer);
 	if (ACPI_FAILURE(status)) {
 		acpi_handle_err(handle,
 				"Can't evaluate %s method: %d\n", dsd_method_name, status);
-- 
2.49.0


