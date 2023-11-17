Return-Path: <linux-input+bounces-110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD47EEDF0
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891261C2089A
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A07D296;
	Fri, 17 Nov 2023 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sysophe.eu header.i=@sysophe.eu header.b="etuTZSob"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 350 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Nov 2023 00:57:20 PST
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu [IPv6:2a01:4f8:c17:3977::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EDCD4F;
	Fri, 17 Nov 2023 00:57:20 -0800 (PST)
Received: from hemera.lan.sysophe.eu (unknown [IPv6:2001:a18:2b8:5601:a2ce:c8ff:fe62:fc79])
	by smtp.sysophe.eu (Postfix) with ESMTPSA id EDF5B2EFE640;
	Fri, 17 Nov 2023 09:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sysophe.eu; s=201205;
	t=1700211086; x=1700297486;
	bh=fMBEIY/I0ZwbjKiENDJG9iKUcVAo08IudR8MdNSDghw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=etuTZSobrmlvW/ZJCuoWJ1VPShCDf5ncnq/1rFg786RFzzfwgPpF7JVx+mr6rYfhF
	 NyS9rLOhH3yZvIh+8+cbyKJRFPg8VbZMAfDddbp9NKxXdHTH1TeiNl8VI7vp7V/Zek
	 OQpXriosJQvDLqxPgaK/4Jx37HzLElAjy/nTUCWg=
Date: Fri, 17 Nov 2023 09:51:04 +0100
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@sysophe.eu>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Bruno
 =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
Message-ID: <20231117095104.4b317a73@hemera.lan.sysophe.eu>
In-Reply-To: <87o7fu3sd0.fsf@minerva.mail-host-address-is-not-set>
References: <20231115102954.7102-1-tzimmermann@suse.de>
	<20231115102954.7102-12-tzimmermann@suse.de>
	<87o7fu3sd0.fsf@minerva.mail-host-address-is-not-set>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Nov 2023 11:27:55 +0100 Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>=20
> > The picolcd_fb driver operates on system memory. Mark the framebuffer
> > accordingly. Helpers operating on the framebuffer memory will test
> > for the presence of this flag.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> > Cc: Jiri Kosina <jikos@kernel.org>
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: linux-input@vger.kernel.org
> > ---
> >  drivers/hid/hid-picolcd_fb.c | 1 +
> >  1 file changed, 1 insertion(+)
> > =20
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Bruno Pr=C3=A9mont  <bonbons@linux-vserver.org>

