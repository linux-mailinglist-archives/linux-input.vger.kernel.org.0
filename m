Return-Path: <linux-input+bounces-8832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1AB9FF181
	for <lists+linux-input@lfdr.de>; Tue, 31 Dec 2024 20:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81F2D1880A47
	for <lists+linux-input@lfdr.de>; Tue, 31 Dec 2024 19:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D256E189BBB;
	Tue, 31 Dec 2024 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fUjzPtHb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009717C79
	for <linux-input@vger.kernel.org>; Tue, 31 Dec 2024 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735672998; cv=none; b=gr1SebQxnQfNG9oII/yllQegzut3/4+hJLwgj1VkBKkESH0yYagpaG4uZC9BWLoP2vi/pAgrESpwrZQfEPsm7dkm8M++0FHRcgBwnyU+7lD7Xo3NIEfofjZF4bNWeVNO+w73foMilMw5HWZPjm10kvoVoFi4obAEuBCQdZoxUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735672998; c=relaxed/simple;
	bh=rsOxmJpdatCthUGLimpEWcrq1+9OzR2oFFsh8TVgFNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fAd4KD7IlMwil7G+AG0BsooS1lf3LHUAPn2RTxH2J9HpOC/3Q+TFpUEkCMAMGE0PgtRwRzBrDorJGgSqXAN4cEr2AoqOIAh3Fy8pZk7Y+uCtpxJigExUAMY1Km/RRVqtEUulQ1pOiNaNbIjmb4wZ6h0pL8vuL4sj13iJ9CcXQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fUjzPtHb; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso19344186d6.2
        for <linux-input@vger.kernel.org>; Tue, 31 Dec 2024 11:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1735672996; x=1736277796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OVtWwkvClnJLuthMxoLYyXn9zqoBPZ6choexSddj33c=;
        b=fUjzPtHb9VxYiLaEaZ+xM1LD8Dc4rm+i5zWY9EWgh2F+cSfnz7lIrlWnbg0k+ywjwl
         chADiKgyL+b8BASNgOb0K6Fn7Hu5AIPzaQK9ffBQ5tCTHpXZEfkM/G7VN7m9WPG81bMx
         9wi4fpI6Cp3/tTm87vXR8JDhWQQEVGSJY+pWUCmWSR1Mf2ajJWI/nUaj0YwILAyadX2M
         lXYFv39MoousHSdOIp5uHxFspnVd0VryrYyhQ5sDr459eCOwcHI9s2XB2UYJsQzbxN2Z
         jzBfYcOzbAmCQNsGTZLnEKg27TTfI7ldhE81qLBT8mGqfoaxBEmvtHvd/sCX+peh6YaD
         vvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672996; x=1736277796;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVtWwkvClnJLuthMxoLYyXn9zqoBPZ6choexSddj33c=;
        b=Q2KUR4V4zYy+6m2vavbPlx8CEEDO0BeBrJpyeM7uLZWr8sKXB+qZQ0J6i1665Unnrv
         hnALlwhioXno0CzmJp9aC2VnhxWkRPkP3nWSS2pkvzTeIo7TwExyaUtXowgqmcw/dE/0
         Df32ZjXD/p8da31+wBVnX5iEbbx9lyeYRZ5qday7xiRjJ+1NP1HKgSSlJdMC3nW5jHRb
         LmzPwrCH5uhVxOO8oudNbqG4OXktS32IFqrgbCVMnPONWMBKIfYjacqYWtYdaOpRjXXF
         etV7U8h/wjBabMs2uMFIYn8gc1dgjgaE+L6F7hSD7BzrJdZ48s1DwqWuV0xmWWoyM6uu
         /d5g==
X-Forwarded-Encrypted: i=1; AJvYcCUfR7NeWXaYkr+WExBp/sGf7vdabkikX5mOgEynxo6TuYxgr8OK4wK1KN0d/6IURLHUQzbhztWfWCxlNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwEKnQwg6FEpABrDQCr6C9d6Rgtalw2gcoaYdiSZH7R+J0tn6
	/tL109J4rUdPcjEuCvZ1Y0pwLoU3qsxJvXD7rUpO5Iq0am+4xt6D6YAt8ChiLA==
X-Gm-Gg: ASbGncsjyFMvzstelGCjIj14pCALsZoAXpTwdHptckPe91gxYt/l4gr57xpzus1e23B
	pe1Je5BI7clICKaprSRhIOwe/z7yrJgbHLcPDH4VQh1JrK2wU1i0VORcaPsibiF0E3QoqysavN0
	AOcu3XPQydfurHXn7G8wVsN4BesRj674Q9cBCIl/okmHp+ezCQ/FIdoJTn0WsaWPNN1wwYdRzYB
	wz87HBKJXCvpnN+bGh91593440yKvvYSzjvxd7vjTpIPqci68xjj1ezsA==
X-Google-Smtp-Source: AGHT+IHgRXHGRDnfjjLWpHmhj/S7J5dFTRI2Keph+F5H7Gn5xqU0fF6cjKr5iJ2MNMuhU+ba4S0PSA==
X-Received: by 2002:a05:6214:2a82:b0:6d8:aba8:8393 with SMTP id 6a1803df08f44-6dd233a2b38mr699727346d6.44.1735672996001;
        Tue, 31 Dec 2024 11:23:16 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5653])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd598e8f26sm60654536d6.119.2024.12.31.11.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:23:15 -0800 (PST)
Date: Tue, 31 Dec 2024 14:23:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] HID: core: Fix assumption that Resolution Multipliers must
 be in Logical Collections
Message-ID: <18b853f8-9da5-4a28-a845-111d42299478@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42fb8b1d-16bc-4948-a214-2892405db258@rowland.harvard.edu>

A report in 2019 by the syzbot fuzzer was found to be connected to two
errors in the HID core associated with Resolution Multipliers.  One of
the errors was fixed by commit ea427a222d8b ("HID: core: Fix deadloop
in hid_apply_multiplier."), but the other has not been fixed.

This error arises because hid_apply_multipler() assumes that every
Resolution Multiplier control is contained in a Logical Collection,
i.e., there's no way the routine can ever set multiplier_collection to
NULL.  This is in spite of the fact that the function starts with a
big comment saying:

	 * "The Resolution Multiplier control must be contained in the same
	 * Logical Collection as the control(s) to which it is to be applied.
	   ...
	 *  If no Logical Collection is
	 * defined, the Resolution Multiplier is associated with all
	 * controls in the report."
	 * HID Usage Table, v1.12, Section 4.3.1, p30
	 *
	 * Thus, search from the current collection upwards until we find a
	 * logical collection...

The comment and the code overlook the possibility that none of the
collections found may be a Logical Collection.

The fix is to set the multiplier_collection pointer to NULL if the
collection found isn't a Logical Collection.

Reported-by: syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Cc: Peter Hutterer <peter.hutterer@who-t.net>
Fixes: 5a4abb36f312 ("HID: core: process the Resolution Multiplier")
Cc: stable@vger.kernel.org

---

 drivers/hid/hid-core.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1163,6 +1163,8 @@ static void hid_apply_multiplier(struct
 	while (multiplier_collection->parent_idx != -1 &&
 	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
 		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
+	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
+		multiplier_collection = NULL;
 
 	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
 

