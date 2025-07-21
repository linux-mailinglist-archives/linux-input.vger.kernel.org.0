Return-Path: <linux-input+bounces-13617-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7AB0C686
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 16:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD17D5405B3
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203B828F939;
	Mon, 21 Jul 2025 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WBjYM/CT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714553FE4
	for <linux-input@vger.kernel.org>; Mon, 21 Jul 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108681; cv=none; b=XeP+jru4ZXkOVlk5PdtWDYF1o4BxwDTL9UYAhgE5m7q4yDCytVDp2LNPuOf9fK7XuhASVIYxNey2BeydHfNekw4BFtx79N8cIJZoLn/q6mGX50ZUatSHeAmlnlUJi9mGJx3seuu6thMfmqMJ24/Ce68QW8hxDHQiZClaUcycy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108681; c=relaxed/simple;
	bh=IccSnGnUczyKc/44zvZoy4blD7YV7Ykzb64QaXHQ4Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK7Lg+L1PbN4qoR0P6yTAl+Wu8kFqrYD3yw6z0Ewt0PTlN4ckV3i+roGsq/kKOn2IkOG7YZpb49kS+pfEExh8qqfVV+mq5jFVZbluJXoqnVNNlUUZS4bVHuH+/ChY5L5TNW4UY2v2XhVryyHN+TpBbnajQFXrVZTmX9Tcx/Vr+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WBjYM/CT; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e34607e575so777799385a.2
        for <linux-input@vger.kernel.org>; Mon, 21 Jul 2025 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753108678; x=1753713478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C/9ylmxApnP7AxoWtezPRKBv6ZGPphJ0NlvJQQ3XOa8=;
        b=WBjYM/CTI2GGKfMkfQ9I7jjys3vA97NGCBt61ORWUqUp3owhlM3bpSVxb9+CGCFxBP
         BldHuTe5N3WREEsbGa2CMfcBMwElE1M9PB7WvUgWHq/rcnimXYQ79PSpQ9bCgJkdXi1U
         lqVMnaaYUwrYyVtEtN2ie9DRNDJMsFK+sjo55elnZSAMdX6qg7uEnpK2nZKF3Z+rI63f
         s6/DBkWzJjDf6l0UJ9/cw7QDzIaGElzSjFkjlFVt0+rsKxifdAniX3t2N/aIln7QkZ3/
         kGQz4FpBNCVB+ZfhtHSr52aB2lx8yQkGufJeuoAyOrK4EomJujb+qafYsSrZFRXUmZ7Y
         tX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753108678; x=1753713478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/9ylmxApnP7AxoWtezPRKBv6ZGPphJ0NlvJQQ3XOa8=;
        b=Sr2/fLcxWTbmQIbTUbr3nmIa6f7WgadSQmWD0Ch9+PXNKgGRaFpEPB5fkk2K+/BKt6
         58Dvjh+3rQ5Be/jnJyPYl3KwTXJI57tpdaGf0iz8d38VFo4k5ZF49YfA0o4F/qOo/hs3
         gQKm0g+R1KajAljcCMRZfXx5RHw82lCDkiNJeXkmoQ7goCbp6GMyTE6LVyC6AjwYDlsC
         rlSsQTnizbrvM+87kxyq2ZC8Q3gYoSiJ5hmNns8hkQFrrksDQlAs8Vw+hwzZ3BOvMJ0a
         ngEdAVbe5BUrMh7hpZhu/4GHeq5Iz2xu9MQV1FfsdGMRCIhp0aZrlNbnVtRzlDWIMiQG
         gpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZvKRJGvJX/lxx0F1DDJY9yXcKKqT1SbilYmaOocHBbwYebKKP13QquY6eJe1bASv4rE7VJFcR37S7Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2D3vVNB2MLh4JBaCoznbblZgKgqATmKfMcYtyWFTMfZixbVAM
	QHoHQEh+Zjs0hkjcMjDAf6Ss/Bh3NZLMJYnaVsE/hpxyHrmvFZFhxMYrx9chXEGiZQ==
X-Gm-Gg: ASbGncudkqhFAc5oMRWce3F0+C2pr00kYLIGTtvrmIxDnKhNo9nJjW+fkNiF9RiINyW
	twLJ+5vMwKVwK9ybWGkAkfucGRJ8tV+Hx6D6DpVlUqqD3LDExTuUqcZIjQPenJ/p+eIJ4kNj+on
	uL1xwzH1bvJVOd7+wLoh8y46U1GOkcFpgoeWj+8tRbGH7NXk5FJHGtxvRltATuv/T/XBN4gezHB
	EwkGhTXMHZIyVJ54dBKx8bTM7/CvLIU5RbyIqJkNam5ENM4VFxkjJZj+2fEMdZBYRZzpZPwIeZ4
	unimhldd3aVLyzMpIJSNJKoh9v6jdxv2ksgSon/Ugxb56I8JR2eTdZxpRB4ZGjLzOFAO/7NUzhx
	vowxSj8uJwAkrBZd95x9ani6t4/5q9xHk3Guc2uoM
X-Google-Smtp-Source: AGHT+IFu9gQ4T/xGAbMTQXG3WPYgohMsmI9ueVB9rM2XMJClNzfOEU7Ji4LWWYs8o8fj+HmfjDCM5A==
X-Received: by 2002:a05:620a:4443:b0:7e3:3996:f4a0 with SMTP id af79cd13be357-7e356b058dbmr1713007185a.43.1753108678345;
        Mon, 21 Jul 2025 07:37:58 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c9015dsm419569485a.92.2025.07.21.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 07:37:57 -0700 (PDT)
Date: Mon, 21 Jul 2025 10:37:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <cd6d1bff-7912-4c55-b2fc-ea2032658ca9@rowland.harvard.edu>
References: <15723551-960b-4257-bfbd-073e136deaa2@rowland.harvard.edu>
 <68791b6f.a70a0220.693ce.004b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68791b6f.a70a0220.693ce.004b.GAE@google.com>

On Thu, Jul 17, 2025 at 08:49:03AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=148b258c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ec692dfd475747ff
> dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=14dd1382580000
> 
> Note: testing is done by a robot and is best-effort only.

Let's try a different approach: hardening against invalid field 
attributes.  As far as I can tell on a quick scan through the code, only 
one change is needed.

Alan Stern


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git c2ca42f190b6

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


