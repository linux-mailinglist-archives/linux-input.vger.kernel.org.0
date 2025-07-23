Return-Path: <linux-input+bounces-13669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27EB0F583
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 16:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B58A53A89A1
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 14:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F192F49EB;
	Wed, 23 Jul 2025 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VGS2sUEg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F8B2F430A
	for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281430; cv=none; b=EVZsanCvTlincwQl4Xcb49MZsXtYaK2Nwn0ogoDN4EB4RlKbehWdp/rVeuMiJpBYpg5GvNZ1QqVmYbCQ7scbKET6n8FK4vlZHJt8KA8GEAwQhTxiuomuDy+8ZEbeWNPzeYLJ0HfJ04fh4Pb214AZGBjPZJuaKLhPxFYlfvpwz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281430; c=relaxed/simple;
	bh=JINLRyPK/XHmrHdv5rDsHCIk80ombuFWRRr1ZoxYlKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfTaAw5njzS1gOInghYTxqUDrHmvqLHLWrWre3KD9ZO8DTT8jD2Dm7ICNdq+nlhe1JxUXlD9fGmv5HFJG5Q87sVdGHnDOnuXNskVcsbIZ6Ow4f+2bnr5Nrr8ldokZeYdp7j64jSSXETkPqhl8GM03RG4OcnD/mqgIfFwoYRa/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VGS2sUEg; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e32c9577ddso634513185a.0
        for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753281426; x=1753886226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6+NdY+dse4TRuCBRLvjHpYzB0jjBdQMknOml7h01sQ=;
        b=VGS2sUEgbNhNkn7CS8v1qyxeuBHvK4okW60e18sKkxSaSEwPBGNrmwKjTYbvkhBi0l
         Ubp0Fu5R3BmD0gKwo4nNt20aRPR+cTE/KheDV2J/QMiSqJp0WeL0HFPDLsnRmHKyu4zk
         6Fchy+Z1Cju2p7hQ+ytdMrgCVRUhq6GlKKi/+BpWolwQI6hazGD4Z2e8vIDNDjJQOHXO
         ufcaG5TJIYZ2XgGCl/Frg7fmCfE5Yrc1VyfbKvAQSfjx+UZRfMdrE35evw0TItCEtfu4
         2qxrVZ+ZDeFawfl3eYVEMrLyzm3HflQ085J0p6M5AuOLwB19wBheKBv8KiA6IsaknpB0
         8i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281426; x=1753886226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6+NdY+dse4TRuCBRLvjHpYzB0jjBdQMknOml7h01sQ=;
        b=PAkSW10WVWrk3SXtI7fr6e4wdswXhoMadDP9IS3SjB4y8C8ZMHvcEOw8KC+3ATdM7Y
         A1Uq+Jrd99w2gvqCHFozuO9+2S7yhVxwCT8W1RouhXVBA1/WLFAKoGijZ5n6ntS9ZPF5
         0YUarrsl/M5UmB6tMyNSR7U60SpTi3iG9mugEbpJyK/fyqw18jz5ab3Q+KEPsp5V6iR8
         6DlDBBGdYzEWCklIQf2WJjRhYEKC0NZ9H5yi9WV/sAaM26BsPkokCTyzUCt5f5Bg2OCM
         qnkmK0FoJHQsCpu/H0SpTkiJqpAo3bwGJQT8paX6WtYDXfao5GSOJkN/NbiodcybwmlE
         0wyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzhFS139nDVBC/P3JqGICoLW0EQNDCAVQelFIPVTYRxuF8cYq3h78ZM4q+WmM5WPm5qoxoRl2ydTO0Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjClPUuK32+L7DcHnWRATsSqtfOhpMnhasHuLy81VoFSkwSeK
	dHcmKsrI6fzRUXjhU3zlhelUlzKAh5jfZW+afbR2pJrQ8ZEhR6pt1pbqwzlixPu8aQ==
X-Gm-Gg: ASbGnctd6cxz2cl1Z7qD4i6Wv0ZMefFrFjjY84l6cDpZU7adMJZ4Z6+KZHRAIcXJV4k
	8shuocPHn/LBqbLaP58mohLKokTmwGvvcygGYq4ZCDrsgAFr9b7tJH8uDuoVCK5G1HZys/moBzy
	1TVoKfJITEiRNeEyJxBmarACaA2XiOaMKQCJmMk9yQM0oZt7xEl0gKFnaTGnaOwmbcpzhEPTh3l
	hS2/0JFeIhkM5YWaIOj/ohLcriIxwUIxZ2q1pwqELnW1JxukEkVczUo/ElFxuPe5u37QC79mO7M
	g5bQ6yHGZp14KjH3dEA13yjhRs67sb6Jo4/A1gaD+wCwcY9roTnRjMTjb89MqnnR72QmOz0HyV8
	csDijmE4mHA6WHldWzqCLM30f55+S/4AxTmzzi07S
X-Google-Smtp-Source: AGHT+IEH8lLGr/T7Yq7vTVpJCS2wP5k4x++B7KfiVNTmkEItDKQVy+YxIS63SuQn6coDEo1k8yA28w==
X-Received: by 2002:a05:620a:2688:b0:7e6:2de8:7c1 with SMTP id af79cd13be357-7e62de8091bmr156750685a.50.1753281426179;
        Wed, 23 Jul 2025 07:37:06 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356b28f02sm657735785a.12.2025.07.23.07.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:37:05 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:37:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>,
	jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] HID: core: Harden s32ton() against conversion to 0 bits
Message-ID: <613a66cd-4309-4bce-a4f7-2905f9bce0c9@rowland.harvard.edu>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
 <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
 <voiysrjm3okjtaz7axqupr2jk5yyvxsqgagbwrsey4z24g6rf4@xb75ss3bwol5>
 <bd033800-53f0-4d5a-a52b-b0e01ac48c12@rowland.harvard.edu>
 <34ks6futbrmunsq2tbz75jwqg64lpk4pg6udbbk3yo2exm657b@3fivbjjdcyl4>
 <750377a5-b5df-4b2b-8e38-0001bfbeb30f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <750377a5-b5df-4b2b-8e38-0001bfbeb30f@rowland.harvard.edu>

Testing by the syzbot fuzzer showed that the HID core gets a
shift-out-of-bounds exception when it tries to convert a 32-bit
quantity to a 0-bit quantity.  Ideally this should never occur, but
there are buggy devices and some might have a report field with size
set to zero; we shouldn't reject the report or the device just because
of that.

Instead, harden the s32ton() routine so that it returns a reasonable
result instead of crashing when it is called with the number of bits
set to 0 -- the same as what snto32() does.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/68753a08.050a0220.33d347.0008.GAE@google.com/
Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
Cc: stable@vger.kernel.org

---

The commit listed in the Fixes tag is not really the right one.  But
code motion made tracking it back any further more difficult than I
wanted to deal with, so I stopped there.  That commit is from 2006,
which is already far enough in the past.

 drivers/hid/hid-core.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -66,8 +66,12 @@ static s32 snto32(__u32 value, unsigned
 
 static u32 s32ton(__s32 value, unsigned int n)
 {
-	s32 a = value >> (n - 1);
+	s32 a;
 
+	if (!value || !n)
+		return 0;
+
+	a = value >> (n - 1);
 	if (a && a != -1)
 		return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
 	return value & ((1 << n) - 1);

