Return-Path: <linux-input+bounces-3252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F78B1518
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 23:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 395A11C236E9
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 21:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BC2156C75;
	Wed, 24 Apr 2024 21:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWJpKUjJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25017156C53
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 21:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713993175; cv=none; b=ggPRucchpbka06mwQGn3kAtR+m25AC5QVTAmnMQhTFV4t+Ajnd/efj2tmC8M3NHMXaL6Us45DFPGvkJsCvXfaloAhq7wXEOAwW00BLtLzO2KvIQK2JMyPDs22jRZwXzCn+vX+6kdXKTZQr9kIJLdfYLiLP5Pwl2TBwNi9dtvl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713993175; c=relaxed/simple;
	bh=EdVFusGI/4Mvx3CKRYu24daxIixifac76Rhu4iq8wbA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H5imWDzm5WxhyVwMPw9GdhVM1OAuZmBb19DNBFjOG7pPOovWYrFA7y8KuvSCG38m7MQ2wuZSLOAXOTpCA1en0lzYSX4GRFtNaZg2A1Cy1dMbjILYenZZkRVHJO8mYE8Qhgo7yf1y4dPkBRZri9eY9dnEgFtMk78zwFIvTAmm8Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WWJpKUjJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713993173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EdVFusGI/4Mvx3CKRYu24daxIixifac76Rhu4iq8wbA=;
	b=WWJpKUjJiHrtBEGUzK/Hpvrs3mgHKgRxrk55QlWfB+m+uGZPeriNd8+tQmF9Dn5zbFoFPS
	cf889tmrM7ClVG0C04CiwknKFdzmfCRaJP6escNJIzRY0AJoVY/UW0vYxmoxlRHyWaOih9
	Q3VqQ8RNDNf/9sL5jzmUW32Kq0jMs1M=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-oIyg9FszOV-UvksCpmgG-g-1; Wed, 24 Apr 2024 17:12:51 -0400
X-MC-Unique: oIyg9FszOV-UvksCpmgG-g-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5aa67354f87so425763eaf.2
        for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 14:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713993170; x=1714597970;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdVFusGI/4Mvx3CKRYu24daxIixifac76Rhu4iq8wbA=;
        b=F0MKEk4Lz/5jex3ciSjF6KL2yIwuj4eaPDKVcPTV9VA/Im0JPZqCvGm5UV1hR3z/Lx
         KcCfOgut8kzhBUswGJY+PPBU0484XOGkwjwkLKhS6xOBqTDeRwfU/+/cXvizMqTGRwV6
         f9pgtEbyqNI7us6EYTTgTnGdB9CWgRoW145aDX+OAZYOSf0mdzkHxVgQ9zRqByhVeahn
         0FovM3y/VRt/7rb9o/RJSILTZCP1frW1VWZDCulTbAJr7LSXzFRA4MO3vlXVa6EH3m/H
         y6qoZ1rwoZfX/uOWDBJsOtBOxDKH057mRbsyuxgf0m0Za96MPU3tto3p8HuOqzUJQv9n
         WLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9fQu1wF6R/wee6yu3N2PnDIw0ItndgG70xu1p5PIgW20Ff8Eo4wtbBU81+qVIo7ujOrpOM8EwzTg+GHe3+NU+evRLh7veYgsF5Kw=
X-Gm-Message-State: AOJu0Yx4e/02IHBfr4dRG/0G3AcNRdifeacIumpC3Xf63QVk3sQcnjjR
	WOkusdcXzCky2L49/H6VQsBKH0WwqIqKDvD5LgZqV080h1Z5L7eSvYR10XfN/JmcTOOUTwJPO1T
	AHntFRy+/n6kv+LbzvbKM2DZHb/5xdR+4hBXRK5Rq2L39AoHkbCeS+PoRjmtRQgSQKzOQbng=
X-Received: by 2002:a4a:3c2:0:b0:5ac:9f22:2686 with SMTP id 185-20020a4a03c2000000b005ac9f222686mr3965269ooi.5.1713993170055;
        Wed, 24 Apr 2024 14:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu7IrTiFLgVOIMI41IZPXqwH9zrP/py9Lj8ux42gKLbbnb1/Jjv+mCda5JQNSR4v6tZCd/kA==
X-Received: by 2002:a4a:3c2:0:b0:5ac:9f22:2686 with SMTP id 185-20020a4a03c2000000b005ac9f222686mr3965265ooi.5.1713993169798;
        Wed, 24 Apr 2024 14:12:49 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::789? ([2600:4040:5c6c:a300::789])
        by smtp.gmail.com with ESMTPSA id c6-20020ac80546000000b00436bb57faddsm6364462qth.25.2024.04.24.14.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 14:12:49 -0700 (PDT)
Message-ID: <cba77b04e244e8b373c72ae1e13defe2b1078cd6.camel@redhat.com>
Subject: Re: Why does libinput randomly calls my touchpad "SynPS/2
 Synaptics" or "Synaptics TM2722-001"?
From: Lyude Paul <lyude@redhat.com>
To: Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
Cc: Andrew Duggan <aduggan@synaptics.com>, linux-input@vger.kernel.org
Date: Wed, 24 Apr 2024 17:12:48 -0400
In-Reply-To: <v08fjo$heo$1@ciao.gmane.io>
References: <v08fjo$heo$1@ciao.gmane.io>
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual; keydata=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
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

FWIW: You might have better luck asking on some of the linux-input
lists.... however

you got lucky because it happens I've both worked on this stack and
dealt with this exact machine haha. So I actually can answer this
(response down below):

On Tue, 2024-04-23 at 15:12 +0100, Ottavio Caruso wrote:
> Hi,
>=20
> $ sudo X -version
>=20
> X.Org X Server 1.21.1.7
> X Protocol Version 11, Revision 0
> Current Operating System: Linux t440 6.1.0-20-amd64 #1 SMP=20
> PREEMPT_DYNAMIC Debian 6.1.85-1 (2024-04-11) x86_64
> Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-6.1.0-20-amd64=20
> root=3DUUID=3D42a17f43-89bb-4523-952f-b8d97bcb4a30 ro quiet
> xorg-server 2:21.1.7-3+deb12u7 (https://www.debian.org/support)
> Current version of pixman: 0.42.2
>=20
> $ xinput --version
> xinput version 1.6.3
> XI version on server: 2.4
>=20
>=20
>=20
> On my old-ish Thinkpad T440, libinput alternatively calls my touchpad
> "SynPS/2 Synaptics" or "Synaptics TM2722-001".
>=20
> $ grep Synaptics=C2=A0 /var/log/messages
> Nov 26 09:12:38 t440 kernel: [18070.908478] psmouse serio1:
> synaptics:=20
> serio: Synaptics pass-through port at isa0060/serio1/input0
> Nov 26 09:12:38 t440 kernel: [18070.947812] input: SynPS/2 Synaptics=20
> TouchPad as /devices/platform/i8042/serio1/input/input35
> Nov 26 20:33:19 t440 kernel: [27221.274488] rmi4_f01 rmi4-00.fn01:
> found=20
> RMI device, manufacturer: Synaptics, product: TM2722-001, fw id: 0
> Nov 26 20:33:19 t440 kernel: [27221.314747] input: Synaptics TM2722-
> 001=20
> as /devices/pci0000:00/0000:00:1f.3/i2c-0/0-002c/rmi4-
> 00/input/input39
> Nov 27 19:28:05 t440 kernel: [=C2=A0=C2=A0=C2=A0 6.327297] psmouse serio1=
:
> synaptics:=20
> serio: Synaptics pass-through port at isa0060/serio1/input0
> Nov 27 19:28:05 t440 kernel: [=C2=A0=C2=A0=C2=A0 6.366655] input: SynPS/2=
 Synaptics=20
> TouchPad as /devices/platform/i8042/serio1/input/input2
>=20
> This without even rebooting or suspending the laptop.

I don't think this has anything to do with libinput - Synaptics
touchpads from around this generation will initially get setup as a
PS/2 device during boot. But PS/2 mode is very limited (and somewhat
buggy) functionality wise, so at the first opportunity the synaptics
kernel driver will query the touchpad to figure out if it can be
supported over RMI4. If so, the driver is supposed to switch the
touchpad to that mode and discard the PS/2 device. So - it sounds like
what's happening is that is broken for some reason.

FWIW: I added linux-input to this thread along with our synaptics
contact: Andrew Duggan.

>=20
> I have some scripts that disable or enable the touchpad (especially
> when=20
> I use the mouse) and I have to use tricks to accommodate this.
>=20
> Why does this happen in the first place? How can I troubleshoot it?
>=20
> Thanks.
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


