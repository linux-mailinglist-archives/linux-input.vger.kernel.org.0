Return-Path: <linux-input+bounces-16275-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0825C79339
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 14:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B43FE36515D
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 13:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917FE342CA7;
	Fri, 21 Nov 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6lIQtYo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kynOp6dJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94845948
	for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763730967; cv=none; b=T7Jis9BKZa7+k1osD8X47kngU06SBnV4osHNodoZWG5IfxrIpplZYfoXbqY6NSIDuJMJq1L8Lkq0ayzYPkAU+0oOJntgdFLbY4rV1do8txHFyJhYQBZk+ly+aSUzOIySrcxHQsFDITUFncvSrDD21blRbLtJew3mZ5KjNlhhEb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763730967; c=relaxed/simple;
	bh=ZhSpw/YpmSavBN1dUJFsnZKHTzQhr4GRcB2pvAgV2dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMGrSwhoinIxAYQI/p0zgFoS95VEShc0tH/getLZg2gIAn+woDHx4L7sSlzI20KeW0dMM9kP/gaWvBvG8oWHStTj1d1rXxZOhVIMy42p0xIiXaaILKwoTQL71CzWYiHlT3eaW/y45nnY5SH1L0CKB5U+3gy41/aNryon+CJHTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6lIQtYo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kynOp6dJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763730963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxL4AjPR/Sfl2b2JcwNF4z36yeSq6EEcb52ZetruLZ8=;
	b=K6lIQtYoL2XfCcCGaDvKfsGfJEWaTfrQJGvVVIfXrDVYRRiD2uiHztAvH50b4EP/YFkuR9
	0JtqojOUl1RcjaqvlVUB0EO1w2ZX+iav8VvOI7JwzJO80SHXYHBomHq4ygRNkPFel1WVwu
	jg9i4qt6jisdEb/EH9ldeVZu5BapZTg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-XcZwTosEO1C_Zd83aKONnQ-1; Fri, 21 Nov 2025 08:16:02 -0500
X-MC-Unique: XcZwTosEO1C_Zd83aKONnQ-1
X-Mimecast-MFC-AGG-ID: XcZwTosEO1C_Zd83aKONnQ_1763730961
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47106720618so18882985e9.1
        for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 05:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763730961; x=1764335761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxL4AjPR/Sfl2b2JcwNF4z36yeSq6EEcb52ZetruLZ8=;
        b=kynOp6dJe3DTzdC/RWK7DPEGuqQjLfn1k3Bt+CRFsegXM3nZNq+BnOFE+XIE1pUMI0
         f5gELZ9YLrK9YNURRJ90qaQ1rrB3B4v21Dd4JtelwwRzH/qrF3e1WZ+PFHEfG516WoGN
         q6KwRchRMXpa+ehFm3G22T2io+ApeuvSakTk5/ezTygbSzOlsfMsQjeHTNHMhFvuC4R2
         wGcugc/E0wVD4dHKkB8u2OS7lV35bFpH4azc+rhMAOe9LTuG/kW5WbFlVhNMCUlz0Kcw
         cui05v+S+Qwo44ohbzZjhfcwXkpGHpAGhT434vnRmCWVLo8/Z71ndVno0gHSm+6Fe7pc
         9N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763730961; x=1764335761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gxL4AjPR/Sfl2b2JcwNF4z36yeSq6EEcb52ZetruLZ8=;
        b=VpnGRf2VfdZYj83eIwrsWpwKrNNaxy7JIYFxC0OkkrwMXdP/hJr5O7622CM/Jsqbyu
         b1ZnQC7yQBWfrLktSp1pQewt8knE4vQEkt/Xbsf4ojaAQW0vcCgbTZEa6LBONpaLO6Zv
         YxjVD4EKzegXWw+0DwPgldlzBbrME/UA0cAZ8Q3azeLUSoYID7uEudGPSmQvPFhTSun/
         8lYP6fX+vnmyF8fInJykb+FsbgKcTwzCeYgrY0DEtI0AgCPCIYy7s0WDnaZF0Xp+WEkT
         /OH1a/lO+OErmicbvtCk4XNYcBo3vy10hlCp1jB2DUVcfhVnSgGpISxC1Q0PIWji8eLK
         xuSg==
X-Gm-Message-State: AOJu0YyQrCcONA08CJ+p7N+Bs7agoCtfbh753q//H0BzIHwew0An+Wqk
	K6cXXqp85Dvxk5DJSLq7KSwCTkmyidqUYrOE34/JPtGAlG4yfH19IuzKIdagJMHjjCiAfq1Fqx/
	+7/4093G0oUTNIDGK39PX0ANC5BvRouKSfBIk+CzC/slcYLcdUavKVHylFOjsJYNbC3KqCB1D8h
	7SBPCF6FfGxDaTG4UXREAHxD02mXwer/nk+BCQoA86AFokKdNR
X-Gm-Gg: ASbGnct3L7ddAbi6NAbSGnqmflHtJCSIbR5UnaW5LYc8yexpMLNMNzKjSs1nM8C+oM/
	lN1y3KzHf1mvqMvuqxEwoE5FzglfLTx/MlZw0IRs8lTmksx1hsl7VTBe1G7laCYXOIzASQIp7hJ
	eNXHqzxW4otGszA8WHnTN4fwqPIFJIzwuIwjgVgqY1iD54pNnbm8wdvugWHudTWSM1zXNeImf+e
	kNcZuPqED41wq3IIMCet3du6j9Alno9o+0UDJMjFSNNZ4BPKaZ0M+VpiPAtWhsd6z4OlsH3++QP
	Mi9XBEPgCU9xg1P+I1wn04Z5SvkvqrC48pQaZ88jetW4UTPPANOH59Q1aq5ALYBw9Kf8/7sd86M
	yedj94pDLhtCTnXxURf1XBmhSoPn2ylMSZWhNBPneFxt0uRLjGoBBuetATsJtXsvBpoirz7ZBQ7
	S4ysXuGdU=
X-Received: by 2002:a05:600c:1994:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-477c0176437mr25431335e9.4.1763730960936;
        Fri, 21 Nov 2025 05:16:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExW9MYcMyacXEWc0tXBj89IgXKkxdm4XxaWwo50oiwPSPIteQC2JzqExYS3RR2fuRMKI/zDQ==
X-Received: by 2002:a05:600c:1994:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-477c0176437mr25430825e9.4.1763730960377;
        Fri, 21 Nov 2025 05:16:00 -0800 (PST)
Received: from sissix.redhat.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3ba1b4sm43077435e9.15.2025.11.21.05.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:16:00 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 1/2] HID: input: Convert battery code to devm_*
Date: Fri, 21 Nov 2025 13:15:53 +0000
Message-ID: <20251121131556.601130-2-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251121131556.601130-1-lzampier@redhat.com>
References: <20251121131556.601130-1-lzampier@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the HID battery code to use devm_* managed resource APIs.

This changes the following allocations:
- kzalloc() -> devm_kzalloc() for power_supply_desc
- kasprintf() -> devm_kasprintf() for battery name
- power_supply_register() -> devm_power_supply_register()

No functional behavior changes.

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/hid/hid-input.c | 49 +++++++++--------------------------------
 1 file changed, 10 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e56e7de53279..5f313c3c35e2 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -530,17 +530,15 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	if (quirks & HID_BATTERY_QUIRK_IGNORE)
 		return 0;
 
-	psy_desc = kzalloc(sizeof(*psy_desc), GFP_KERNEL);
+	psy_desc = devm_kzalloc(&dev->dev, sizeof(*psy_desc), GFP_KERNEL);
 	if (!psy_desc)
 		return -ENOMEM;
 
-	psy_desc->name = kasprintf(GFP_KERNEL, "hid-%s-battery",
-				   strlen(dev->uniq) ?
-					dev->uniq : dev_name(&dev->dev));
-	if (!psy_desc->name) {
-		error = -ENOMEM;
-		goto err_free_mem;
-	}
+	psy_desc->name = devm_kasprintf(&dev->dev, GFP_KERNEL, "hid-%s-battery",
+					strlen(dev->uniq) ?
+						dev->uniq : dev_name(&dev->dev));
+	if (!psy_desc->name)
+		return -ENOMEM;
 
 	psy_desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	psy_desc->properties = hidinput_battery_props;
@@ -576,36 +574,15 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	if (quirks & HID_BATTERY_QUIRK_AVOID_QUERY)
 		dev->battery_avoid_query = true;
 
-	dev->battery = power_supply_register(&dev->dev, psy_desc, &psy_cfg);
+	dev->battery = devm_power_supply_register(&dev->dev, psy_desc, &psy_cfg);
 	if (IS_ERR(dev->battery)) {
-		error = PTR_ERR(dev->battery);
-		hid_warn(dev, "can't register power supply: %d\n", error);
-		goto err_free_name;
+		hid_warn(dev, "can't register power supply: %ld\n",
+			 PTR_ERR(dev->battery));
+		return PTR_ERR(dev->battery);
 	}
 
 	power_supply_powers(dev->battery, &dev->dev);
 	return 0;
-
-err_free_name:
-	kfree(psy_desc->name);
-err_free_mem:
-	kfree(psy_desc);
-	dev->battery = NULL;
-	return error;
-}
-
-static void hidinput_cleanup_battery(struct hid_device *dev)
-{
-	const struct power_supply_desc *psy_desc;
-
-	if (!dev->battery)
-		return;
-
-	psy_desc = dev->battery->desc;
-	power_supply_unregister(dev->battery);
-	kfree(psy_desc->name);
-	kfree(psy_desc);
-	dev->battery = NULL;
 }
 
 static bool hidinput_update_battery_charge_status(struct hid_device *dev,
@@ -660,10 +637,6 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	return 0;
 }
 
-static void hidinput_cleanup_battery(struct hid_device *dev)
-{
-}
-
 static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
 				    int value)
 {
@@ -2379,8 +2352,6 @@ void hidinput_disconnect(struct hid_device *hid)
 {
 	struct hid_input *hidinput, *next;
 
-	hidinput_cleanup_battery(hid);
-
 	list_for_each_entry_safe(hidinput, next, &hid->inputs, list) {
 		list_del(&hidinput->list);
 		if (hidinput->registered)
-- 
2.51.1


