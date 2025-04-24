Return-Path: <linux-input+bounces-11994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EBA9B828
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 21:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7E6A7A5992
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 19:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A882E27F74D;
	Thu, 24 Apr 2025 19:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt+E0UL0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC561A5BB6
	for <linux-input@vger.kernel.org>; Thu, 24 Apr 2025 19:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745522296; cv=none; b=mcfUckZF3JsEzl1EYo7VtO/unLUIxCCe6kn1eruwJ4X80UfSbnucTfMssK9dQZjqZ0bNBthuxUxzp+qsJ5MTRMgxGvZhWGsKEkS/1Ll6l/QZdNb5Y5TWL49+n/60eHDB7jLUq2HzcxAh7pqBTn/Bl472qJF1jQOU/ZrC108PP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745522296; c=relaxed/simple;
	bh=7U2gu5W+M2rJM1hysIDZpjGhu4K0flxG7zXDxHU1sA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEtdP2gJgB84ZMwqLwoUCmK8lZgW2huvzeAXcUdBkUtUTnckvaEjK0qCNmJPapYLnHddvRNBFAqIGPmHAe7rHSrkKhDPd59yj5SR/Da7XdF+ocXrSZ5kOOSMyHOLRNnDfHImSM6rPWKpMHeS56PS1ACdS6gChezMsM/TnVEwGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt+E0UL0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso6808385e9.3
        for <linux-input@vger.kernel.org>; Thu, 24 Apr 2025 12:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745522293; x=1746127093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7U2gu5W+M2rJM1hysIDZpjGhu4K0flxG7zXDxHU1sA4=;
        b=Gt+E0UL0wSUh8ie7oGAdDzyHyw7F/XFFnI1WM0zYDO/ZaOZGefIXkSV3Fsi1Kr8AmZ
         eMew4VwHs4BTuWoeK6mCHaByvzKI5x0+jyCh3oY6od6q3Gl6mJ8H9ySPCByJ9nP7HchZ
         Krx8MU1czi7z0/aPVjZiNmlM9IXlbgSSKd4zc0LiAt13/Qc/0xRFfRp40gdx1KrLADO2
         R11u+uhUOhxSkVmpnRnBVzvvmGRKgSWnLUo9HvpAC72lyd5ch53Nlmyvd6Id2rFSi3JZ
         qKEA9H5nK2SHnAf/iIeUA3kp+tE9RTbmQ5k+JgfxwmtVCvKAFUdVGtK7p9SEvOGGsd6e
         seRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522293; x=1746127093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7U2gu5W+M2rJM1hysIDZpjGhu4K0flxG7zXDxHU1sA4=;
        b=BZJT+5mb6XrhnvPR4wEBcOXMf7fNdPnP3Gbo/yXiGFfiLX8kttAYrPjfbPUtlr/6vZ
         XzTxiCNOM7DKUCzRQbrA+hfwbD/wWlYkgdz+1YsjDVD2rzlDTWltzgmU7RHyqHHg4CKn
         9v+17FkheOaKuTEfuzpJIW2/NXWuUHO1ZP7iQOj762QcFZvpbL8H8YlH9gjA1kotvE0g
         CRj/AFSW7G+HmVfi6fulI28mBk+QmNJrEjdk8C3/bAexXWG+G2QwUzFCo3baW2kAoOS4
         8+wenbnNUM9w5xS9C+PvJpDvRM+/5HEX+P5kBo51c4IisiB1RCsv4vXnDlWr+ahr0Mxu
         f+ig==
X-Forwarded-Encrypted: i=1; AJvYcCVdqFLa4/RfA4/tmE9p4NF7hfNNfq7yZYnjy/ZadNEDJyP3qxVcVLLiI1S6Dz9lJeS8j8TTN/PEOHc8BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxfJsOvRb3uRytJ1UDjkp2yH7GkAxtLoiKp0YA53v6BnsXwi6
	fvqJyqKWxSJCb9Yz8/KZdx2kfpdQupKpAdyqDtIT6Q27n8kQxdLwyP/lNfsJ1jS0+hOPoCVyzAW
	wHlVuLuco9ZpZiz9/uBWQvh79Dn4=
X-Gm-Gg: ASbGncuapm4siypWLIiZ8jtSUVPQ0alAyxKPAcQjZ/hxwlKOtULzXCxGEyQmimSwkGF
	4wZnPk+mNx1PHtAFsBl1PuYH12nnYdA+0T2lBmGtLWYA67cZwC+Vf2lrU7uX3rNdjmSFGyCdKtc
	cAJTAulVEjxC//DlA20CnFNyU=
X-Google-Smtp-Source: AGHT+IGVvMpHDOQKsxrLLM84Dp+k18pZFebkLMdJihN6Ons5rZM46p3YmxZOV5jB8qm3hsbVH0Orwp+Q5vZOHTQye+0=
X-Received: by 2002:a5d:6da9:0:b0:39c:1257:c7a3 with SMTP id
 ffacd0b85a97d-3a072c150ccmr458550f8f.59.1745522292959; Thu, 24 Apr 2025
 12:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh> <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
In-Reply-To: <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
From: jt <enopatch@gmail.com>
Date: Thu, 24 Apr 2025 20:18:00 +0100
X-Gm-Features: ATxdqUFrtY5qBuewf5BTeZzQORXemXn2P497ZsgfGxp9Jk4bgJByXQ0zAgFfdbY
Message-ID: <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 20:48, jt <enopatch@gmail.com> wrote:
>
> On Thu, 10 Apr 2025 at 10:02, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > And please send me another dmesg of boot with the above config and
> > i8042.debug=1.
>
> My first attempt was with "i8042.nomux=1
> psmouse.synaptics_intertouch=1 i8042.debug=1". With this combination
> of parameters, libinput only sees 1 pointing device which it describes
> as "PS/2 Generic Mouse". However, both the touchpad and the trackpoint
> are able to move the pointer under xorg.
>
> I then thought to try removing the "i8042.nomux=1", leaving only
> "psmouse.synaptics_intertouch=1 i8042.debug=1". libinput now shows 2
> pointing devices: a "Synaptics TM2769-001" and a "PS/2 Generic Mouse".
>
> I have attached both dmesg outputs for the above. I can attach as many
> different dmesg outputs as would be helpful to you - just let me know
> exactly which different parameter combinations you would like me to
> try.

Hi Dmitry. It has been a couple of weeks since I sent this, and I just
wanted to make sure that you had received it.

Best wishes.

