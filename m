Return-Path: <linux-input+bounces-14467-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E9B427D8
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 19:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8CA7482D49
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 17:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CBB3FF1;
	Wed,  3 Sep 2025 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrMgEojZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928C819343B
	for <linux-input@vger.kernel.org>; Wed,  3 Sep 2025 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756920080; cv=none; b=DXvo2ybZHBs5vdZnYqPYaWz8GoGQE7Y9yI34hE7GwTIV/R9uJ0XjXMMe4CPob2DKRxMCbGPArrih8/YPiC9lUi0aYMf5EmsvBg2cJP1QcOp2YI98faGZxvB2i0S2bL1CktmN/QDiqeTHL6rxjTDJH0IS/xsi3IHUEskxl4kfPT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756920080; c=relaxed/simple;
	bh=7ye/ou/IPfg01wpB1bQhqId840VkIhn21bIfMpPv+s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4QtOMVaJ4Mm1PI8Jomd7goNdMxwK9GpMKdWyTCa75n/NYGBsnDtZPEuzc9CCb1aP+gXTMW7bqlbHpO9PvgDgDz9mCj78ePFI+uWhANUSmDR2YhLpZzcGrUc1FHiMWVTMwpMXFa0KuY1VKKG1EHTMYRSSUHdz8dSxrg7c61GFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrMgEojZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3cf48ec9fa4so123551f8f.0
        for <linux-input@vger.kernel.org>; Wed, 03 Sep 2025 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756920077; x=1757524877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3tOYS4uUTq6gXkt/XgdIdqjXYhwtrsPYjXqJP9K8RWo=;
        b=UrMgEojZBSwKPWaRqnCO2P5lHzR91nNJU0XrSVfZyvLNCCyOQUOkc0CCo7RlKE7wuV
         R2gvW0bPGsEx+rZ9kfB2gKqBY8vQEVS5XAfWWPw6bgYNspFCV1HKvQ0gXz30n0xj+LOZ
         Cw5pVJzUgL/o//hIUBoJV01JmiMxwd74REjQ0WyvFiRhVydizYEDMnbWUEDup3LIBRjL
         GRtBbqsVpBgBrcBSLbj4dwRXGfLVFHbo6zP3YMggf7m5tXQGjo5JcUDcp4E0lR3S+tEB
         D78zmW0/U2vnVYygxcwwhRWrS8UAX6dvCqiXj7UlodX7E39aXXP/21KbIEQdBMTzpA+a
         YZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756920077; x=1757524877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tOYS4uUTq6gXkt/XgdIdqjXYhwtrsPYjXqJP9K8RWo=;
        b=n5UAA19LBbDZLrl82dnVKiGsOL9BT/aUZ0Z395JqPFexn45Z5oae6iu0MmqWJZSddM
         u1kHH+GDK0JvppKfQHxabDzhOYuGGl9Yl0IIreFAJlMVpuKTk5YWr4q2qUa81zHC/mZk
         PpGW7dNlQAL8gnoOE03HQwhDbzgAiVrAgclR+G1OyMTp4Ob4FXTguRGycVbZbbj27rUN
         k8ud97zxxp1NA61SuE7S1HePR9wv2RTQ5i9BjND8WLjj96poPrjXCiJPCAugJoXfZdc0
         7kLc4wJMfBTixxOAGIFJ/4c3JL3MSGX98dLMoPKfdbuNF4j6ZH/fynPzo6mHmhV20HQa
         wlZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuzdUrJy1wKMffZ/p+rPdLwDzYd4fxGRrGcB/GqjIZiXPS8wZUPPldo9HB25a2I4H4p/jY7kCE6n/x9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPFYsMeDudvJl+LJe6zp/g/WLcHwsk0sye6l4w2BYaCCSuAsU
	rawuPYJRSbdmIdA3kKDJzAl0TEpHuqwPrchTINld3o3lVUqzW1rb058c7bUKLnthXfsB3eOfNCP
	JxMHz+6vF3P1AqYpB3g5sOlvkvEoyqRc=
X-Gm-Gg: ASbGncvBt712FwRiZpwdTJCNICbCCxzvCo7qxv/xPHiXFgu4bfTwy+18qCXi4c56oxf
	9NtAwHha+cbmzhuDG7hFCX7eZiZ4d/WtBk7/5DpoKeAEYfsb26eJVz7TtV9krFwocXlp2dfJuSQ
	q284IfkLlfyVV9kgQ3R6BHPdir0YqCXUw7WkoWQKIbV1Oyjxf7Wk2fIxJ04z6Xm1l+2h0A8j1ZE
	tOkysqnN/fL5FiiaQH3aTLBYUHOnAUbaBZfDoHvBQ320oGhQ8c=
X-Google-Smtp-Source: AGHT+IE9zqpoaQ78joJqYIkUJiwPdxmrUMxUgMp7Y0zt9SakPuZOPr65Aep4JwJEXSwoZHnwb7Dt82cyhkwZeoVI18g=
X-Received: by 2002:a05:6000:2384:b0:3cd:ac2b:7f0 with SMTP id
 ffacd0b85a97d-3d1def61f55mr10269694f8f.49.1756920076680; Wed, 03 Sep 2025
 10:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
 <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com> <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com>
In-Reply-To: <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Wed, 3 Sep 2025 18:21:05 +0100
X-Gm-Features: Ac12FXyWpJXWXL_fXVOTOF_aWfYyp7Zno05lqLy_Wpgd_X64gpDtrVJx3VboDgs
Message-ID: <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

> Thanks for taking the time to test it.

No problem, I had a go at this a few years ago and had the same issue
with my patches.
I did email the last Logitech contact I could find associated with the
driver, but he seems to have moved to a different part of the company.

> Is your product id the same as the one in the patch or are you modifying
> it before compiling?

No modifications, it's 046d:c547

> Can you please dump the HID descriptors from your receiver
> (sudo usbhid-dump -m 046d:c547) and share them?

Sure (hoping this doesn't get mangled):

001:003:002:DESCRIPTOR         1756919882.495801
 06 00 FF 09 01 A1 01 85 10 95 06 75 08 15 00 26
 FF 00 09 01 81 00 09 01 91 00 C0 06 00 FF 09 02
 A1 01 85 11 95 13 75 08 15 00 26 FF 00 09 02 81
 00 09 02 91 00 C0

001:003:001:DESCRIPTOR         1756919882.500790
 05 01 09 06 A1 01 85 01 05 07 19 E0 29 E7 15 00
 25 01 75 01 95 08 81 02 95 05 05 08 19 01 29 05
 91 02 95 01 75 03 91 03 95 70 75 01 05 07 19 04
 29 73 81 02 95 05 19 87 29 8B 81 02 95 03 19 90
 29 92 81 02 C0 05 0C 09 01 A1 01 85 03 95 02 75
 10 15 01 26 FF 02 19 01 2A FF 02 81 00 C0 05 01
 09 80 A1 01 85 04 95 01 75 02 15 01 25 03 09 82
 09 81 09 83 81 00 75 01 15 00 25 01 09 9B 81 06
 75 05 81 03 C0

001:003:000:DESCRIPTOR         1756919882.504793
 05 01 09 02 A1 01 09 01 A1 00 95 10 75 01 15 00
 25 01 05 09 19 01 29 10 81 02 95 02 75 10 16 01
 80 26 FF 7F 05 01 09 30 09 31 81 06 95 01 75 08
 15 81 25 7F 09 38 81 06 95 01 05 0C 0A 38 02 81
 06 C0 06 00 FF 09 F1 75 08 95 05 15 00 26 FF 00
 81 00 C0

