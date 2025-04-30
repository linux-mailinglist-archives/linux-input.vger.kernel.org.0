Return-Path: <linux-input+bounces-12080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF102AA3FDB
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 02:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66B83BF972
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 00:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7562DC770;
	Wed, 30 Apr 2025 00:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="M/uncUNA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QXtUlf46"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578BC3FC7
	for <linux-input@vger.kernel.org>; Wed, 30 Apr 2025 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974362; cv=none; b=izsP1o4s/Y4XuXLKsXKiqtZWfYRNHLVvzAseH6IomZ0ixjoH4Iaq+tQ9N+8TaJD/WVvhFMY8sbBjCD5NhTNo//wYZ0L4e/8s0yp6IecxypyV2yE0R2PLJljeVkHWsr8YDqQUshjROY4/2ZU9SLFpl1H5B9JQWAgpzxuOobSTthk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974362; c=relaxed/simple;
	bh=DUySbIdTHofV9OtDMECvU0jVXBX4oaAJ3Zv+pcM0JIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofyC6j2QJzVX8wTxBTV33jvj0HYGG5her7YE5PRlPbzdkPce2w2NDUfHNZ3wsEmztvu0vudMPomUoVtFs0mX0O47GMikZDEE1yLS7lQX5wR2P/OOjel42PMK137vtbmMU+JALavi/vTPUYiaR0Js+i3EiihWJiO3nr746KkZS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=M/uncUNA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QXtUlf46; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0B93F25401FC;
	Tue, 29 Apr 2025 20:52:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 29 Apr 2025 20:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1745974356; x=1746060756; bh=vHvayq2oBB
	J6m4wzLw0rm7Yo06Mg+uGj4Q9s172GcVA=; b=M/uncUNAalCQhdOGh6vOPt9WxE
	z2L/drA4YreBPNxkNqzEZ5kd0hOW/4bL8ivXCo6czz53HKpoDX8118eQev5F8EAF
	Mb1AaxnL1gJvKiJEs1vU3LcaBlQUyqtLliX0OELK72t1x4jifM25bqwIM8ODx7d/
	JRNceXK9zWVg5SGMfN2kTnqT9N8vYEPOymMh7JyMLlEi3P4jEDeaIKx0fd4icpwx
	tfab2xK5DesO7JedQiaoyKQt6ViQnFkYaWsi6If/8KCpefZIwtO6xHFxyj6hOjgI
	FhGaQaBquYVvGHAmGU4Ghn1rEHFMSt9WpOICxcFjqdp5Sn8+n4GDAxn1265w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1745974356; x=1746060756; bh=vHvayq2oBBJ6m4wzLw0rm7Yo06Mg+uGj4Q9
	s172GcVA=; b=QXtUlf46ouYPbfyESxAhGRSxr1GmekGj/KHOvGmL+K8+btLrCbS
	qd8jLhbFOWTWAKPnAPgyFFJk8xSVSY6iIk6p0hZsETgBi7jFcA2S4/VOZzpA/3NO
	xrw9swUQ7o/vke7ESDqkNHSlJDthTnTabz6QdgObpevENiBzcumgx/PK9Ht/Um4r
	qqQbC+dHEMAIH5/nyYeQDyILLrjX0leIjaus5FX/xJpByU7KTDtroVGK1/fQ6TTG
	EV7ABdNj3dgr/1CYwonlR+grptVOxghNe/FkKg6fPDx3yctOU76rxQ/d+ylbbltC
	Hepm/yYY49f8eAiwoCqW/lNjDtUhWiBb+qg==
X-ME-Sender: <xms:VHQRaEfjAM7xFrt9FFpGXBrjbU5f6GMyZR1sKKcfDlVZWYyUTB_vug>
    <xme:VHQRaGOr_OGOKRyISk1ObyFK0-cy1-3mm8B662Oh-oq4-EQ6hFjGPByfiU8IpZGHP
    WTnVD-EEr2ZSZHBqTw>
X-ME-Received: <xmr:VHQRaFhDNAsfOpb6AuCcd10FFsiTFkx42XrkYYyMB2e4HC3t-W0sJc9HbuCnjpB8ZCvxKmmU8tfQt5imetMkyj10WmNJbdXJ4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieehfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvg
    hrvghrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpeejfeffvdffgfegieeh
    teevgfethfdvgeeileffkeefueeivddtfeegfedtkeevteenucffohhmrghinhepghhith
    hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtpdhnsggprhgtph
    htthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegumhhithhrhidrthho
    rhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghnohhprghttghhsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepghgrrhhgrgguihhthigrtdeksehlihhvvgdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:VHQRaJ8oxWMutfR4LSA6vamvhcR7RKN7dTuxZlTC0KDWGyhsX5f7gw>
    <xmx:VHQRaAvqSC6kpqrqlCR_yDW7PVbMj_CrOQq-OpmmEGC8Jet9lJc97Q>
    <xmx:VHQRaAElXARNk8zeymZYeHypnkcXe3G_XwJEbHnmYf6m7qkQ2Hy95Q>
    <xmx:VHQRaPM4BBJ1CZTp1SQOO955CcspdBOUD-NNr7kZrh0wl4oBFvElTg>
    <xmx:VHQRaN4QyEp1v6nHbOGaYNXu8QbrG3NNfNmCadTs5uhmXmZ_1PZezdVk>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Apr 2025 20:52:34 -0400 (EDT)
Date: Wed, 30 Apr 2025 10:50:28 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: jt <enopatch@gmail.com>, Aditya Garg <gargaditya08@live.com>,
	linux-input@vger.kernel.org
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Message-ID: <20250430005028.GA1651740@quokka>
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
 <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>

On Mon, Apr 28, 2025 at 06:19:07PM -0700, Dmitry Torokhov wrote:
> On Thu, Apr 24, 2025 at 08:18:00PM +0100, jt wrote:
> > On Thu, 10 Apr 2025 at 20:48, jt <enopatch@gmail.com> wrote:
> > >
> > > On Thu, 10 Apr 2025 at 10:02, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > > And please send me another dmesg of boot with the above config and
> > > > i8042.debug=1.
> > >
> > > My first attempt was with "i8042.nomux=1
> > > psmouse.synaptics_intertouch=1 i8042.debug=1". With this combination
> > > of parameters, libinput only sees 1 pointing device which it describes
> > > as "PS/2 Generic Mouse". However, both the touchpad and the trackpoint
> > > are able to move the pointer under xorg.
> > >
> > > I then thought to try removing the "i8042.nomux=1", leaving only
> > > "psmouse.synaptics_intertouch=1 i8042.debug=1". libinput now shows 2
> > > pointing devices: a "Synaptics TM2769-001" and a "PS/2 Generic Mouse".
> > >
> > > I have attached both dmesg outputs for the above. I can attach as many
> > > different dmesg outputs as would be helpful to you - just let me know
> > > exactly which different parameter combinations you would like me to
> > > try.
> > 
> > Hi Dmitry. It has been a couple of weeks since I sent this, and I just
> > wanted to make sure that you had received it.
> 
> Sorry about the delay. I looked at the device initialization and the
> "TouchStyk" device does not respond to the Trackpoint protocol queries,
> so from the kernel point of view there is nothing distinguishing it from
> a barebones PS/2 mouse.
> 
> Peter, is there a way to add a quick based on system info to libinput to
> identify that PS/2 device as a trackpoint variant? Unfortunately HP used
> the same PNP IDs for the main touchpad and the trackpoint...

udev's 60-input-id.hwdb [1] is the file to edit here - if you set that
to tag the device as ID_INPUT_POINTINGSTICK libinput (and in theory
other userspace) should treat it as such and no other changes are
needed. That property is set by default from the
INPUT_PROP_POINTINGSTICK but, well...

That hwdb doesn't currently support dmi- or name-based matches though,
but that can be fixed easily by copying the rules from 60-evdev.rules
into 60-input-id.rules and replacing the "evdev:" prefix with a
"input-id:" prefix (sounds more complicated than it is, you'll be able
to spot the pattern quickly, TLDR is those two rulesets should be
near-identical).

Then you can do something like:

input-id:PS/2 Generic Mouse:dmi:.....
  ID_INPUT_POINTINGSTICK=1

And that should magically work. That's the best we can do here, I think.

Before you get to all this you can test this locally by (ab)using the
evdev prefix:

		$ cat /etc/udev/hwdb.d/99-mouse-id.hwdb
		evdev:PS/2 Generic Mouse:dmi:.....
			ID_INPUT_POINTINGSTICK=1
		$ sudo systemd-hwdb update
		$ sudo udevadm test /sys/class/input/eventXYZ

with XYZ being your event node number. 
And that should show ID_INPUT_POINTINGSTICK which means libinput will
pick it up next time.

As for the dmi bits: pick something useful from
/sys/class/dmi/id/modalias, see the 60-evdev.hwdb for a rough guide on
what to pick (usually a glob with svn and pn or pvr)

If this works with the evdev prefix you can have a go  at extending the
rules and then adding the proper input-id hwdb entry to the
60-input-id.hwdb, getting it merged into systemd (cc me please)
and everyone can pop the champagne. good luck :)

Cheers,
  Peter

[1] https://github.com/systemd/systemd/blob/main/hwdb.d/60-input-id.hwdb

