Return-Path: <linux-input+bounces-13444-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD855AFF02A
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 19:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDBF37B5E97
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 17:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF2D2367D2;
	Wed,  9 Jul 2025 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GeIHh7Uo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9E23644F
	for <linux-input@vger.kernel.org>; Wed,  9 Jul 2025 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752083584; cv=none; b=Lb1xqyU5REkjghpvZNNEFy9RMvmiRO+qvKIL0EWeHu/cseJ4PkgKXGsk2K6khIs8ph9yscStcAJwxVNLu/K2OIeQ+KJHPBZ+41+al8TKzNhZ95d1UORjPkaCo/eMYcP26DbqGby4xTm2TXnucfr8B3ZPlOXyCRJ6k+TgNypSIFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752083584; c=relaxed/simple;
	bh=5Ia0HRV7zH2WBWN+qpcO4e/eQosXMi2uWlBScRIgOoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ne8fzBK9bmkOXq2RHtzdwUSjhahIWoqQKv31x2mnFv6Dcw4wHDCgUVd2UIFJjxXR/AnNl+cY85uqzpjGT7IqINC0wy0dKM38QS+qoBmiWBEJYwsodopAD0sydjaoeIJ/J4+Vc0mFHah09lNU7LupTXJ1Nse458kcxtbI7nwvjEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GeIHh7Uo; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fafb6899c2so2424406d6.0
        for <linux-input@vger.kernel.org>; Wed, 09 Jul 2025 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752083582; x=1752688382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kcOerGxtDRl0IqsXa2Fyv0O/gmOLQbQigHP1EIwUd0=;
        b=GeIHh7UodvyMCRJ8oB0ar8ilUn/fFCiaTul5j9IwXGry1mmBfZFTuRV9qafsayDVpn
         YSF2TLFYLj4yDDN/VvtbF9E+dffRjovmPzWmQZn0CtuINVtzkriImFEKt2mbP7XNFW0b
         3vwq+2FW9y6pc2Lel0widrJ7t2rIyuR9ZOx1VG3DtkwHpVyc0hL7BuIdAZlslvF+awB5
         9JjQNLbDQmTX9iv5XgBUZOJ3igobGqbe3Nivs37hq3UpjOPzoNu4ifB707Zo/2X2TO6l
         D4x5K1osPBRCfjca6JxOu5O5somCV208lCmsgTakQBs8Jj4b9+16h3h/m6cQTn4LEwCT
         Yo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752083582; x=1752688382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kcOerGxtDRl0IqsXa2Fyv0O/gmOLQbQigHP1EIwUd0=;
        b=GeDTlgwiHVMf970JHzeJjxB8otJMZ4a1X5EjCHcXVCFHmiWAR2WNPnHtwdlE1AAI8P
         AtbAdxoNP0RVaOVgJOm4HwbHVlIdhEsSaT9WggZVvNJIjq4wbv8blWULgvbzBFpFQ7lw
         dGIiY8ibOImOIgsmqaulpTuNbL3zUeOrhIqQFgWVL56zt4gAVRmu1O7yAAB7saxOlaOB
         hzRn349g+5QysIFOIQ+rm01EpG8FQoKEW+AyP+ayEskbex5nOK8SwxEbpaND0Acw23z1
         0ZdqPfWZFOymEgKnqAq7oDYkHqclzud9xdYxX2IdOjX0aiBYKpdx/SND9NZSK1eQGfDf
         UDoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUme6mMi9qRFaZkaj/Wp64cTuGxNFL+9xjVzIRHUNnZi3Yd4AGlDJPh5hNxyWvYwxhGK+HuUMkffUp3bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlm8Z22HqHsFLNzXU5bH9E9r9ys4j5FxEv42cLpbybVjsvH/Mf
	2aVuBX7vbIFNqUpXO2/agZQuDGHgURQV/fgcmGDIxuGlaSLz/G0XbFeRATv/VhR8oQ==
X-Gm-Gg: ASbGncv3wsiJeuMCAXtFUsgFAsjjRwDq1k+gR+DrnBwd5L1BMm3KtJnzrzoELJrQOPh
	LQ5RvNlJyAXYVi7qlKalNgSXZ4dx5fhv2z6IuB3bOLDr3hl4YHLm/6Ep2fRMU1RiiQY2eG71zLc
	aHAjN09tQYp9amH2ZROsk7KDN1XVyi43WqUc9SNOWOE9iPGdLxLjN5sYkM9H+SbGKkJCKtv8DGN
	ru0LbCDVmilS7QNRQ+odnzX5h2W8BipmSaepK3OIQmQQZd+mjVad4Q3VOgKKdrEnPp2yVNARWuJ
	bIgceDTdX8AQkAqzpYiqW6VGcT7faqh3BGvGMPn9PynPNzD0o7wBUWCjMv5T80nYoyYqnT/Tfjj
	gYB9KaYfR1+8sPlnoqyNZVXmxwtpP7dnRlc9w9vv9wdE8agXn15u2WHo=
X-Google-Smtp-Source: AGHT+IHR6B3aBT6nP0giOBXXSp3GYX42d9A0RoMZKZC2VFmh9qTAyRprUaeevr7Q5whyisQ/mru2/w==
X-Received: by 2002:a05:6214:5882:b0:702:bc5d:475b with SMTP id 6a1803df08f44-70495a2ac6amr5938216d6.1.1752083581895;
        Wed, 09 Jul 2025 10:53:01 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d64feasm95362966d6.121.2025.07.09.10.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:53:01 -0700 (PDT)
Date: Wed, 9 Jul 2025 13:52:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in
 mon_copy_to_buff
Message-ID: <681c4eac-e812-4022-96e8-cd6cada73910@rowland.harvard.edu>
References: <5de04492-01d3-4b2c-b3f4-8c2237dfed6a@rowland.harvard.edu>
 <686c14c0.a00a0220.6237c.0000.GAE@google.com>
 <72fea4f2-40d7-4f9f-a08d-b1ada781256e@rowland.harvard.edu>
 <5644bdbc-8449-407c-8e0c-e725e10a40f1@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5644bdbc-8449-407c-8e0c-e725e10a40f1@rowland.harvard.edu>

Test patch to see the contents of the report descriptor.

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ d7b8f8e20813

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -1043,6 +1043,10 @@ static int usbhid_parse(struct hid_devic
 		goto err;
 	}
 
+	dev_info(&intf->dev, "Report descriptor:\n");
+	print_hex_dump(KERN_INFO, "  * ", DUMP_PREFIX_NONE, 16, 1,
+			rdesc, rsize, false);
+
 	ret = hid_parse_report(hid, rdesc, rsize);
 	kfree(rdesc);
 	if (ret) {

