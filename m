Return-Path: <linux-input+bounces-13204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47182AEDBA4
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 13:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30458188F356
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181D6283CBE;
	Mon, 30 Jun 2025 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHoJ9IjL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C074280CD3;
	Mon, 30 Jun 2025 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284267; cv=none; b=I+1OrzohwprI3V8kPh0CzyJC7i9ohCwFxTpUFQo3g7g90tuuzd4nxm6cMWX/4mPww0KTBUhkmfC3HNgjBH9h9tHUNPuI+4YqE4jC9go2Q+84hBn2/K0TB+dpesuD0unNDxgUGl5IBUrqFufsgxQZeJ9/RUh6zADQwtCt8uORocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284267; c=relaxed/simple;
	bh=eq68b++dNbZV7pveROonXKwtHxiuaKovNI1OK8hCDXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHXYyhhtnT+4RffOxVQSzPdvxSPZcA4kdkQCGUOhVRRDvZEnDO/tHvoX/s4GRlsWsoLijE+TXaVr+c95l/U9Jy0NVonRWJ46Ok5uzTH5pW0r/PqBRGIEnFnKoL3KNGov0gBIANei1HxX6HQ8be5PsVrwqyZGAyflJnzEYMC56Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHoJ9IjL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235d6de331fso22770985ad.3;
        Mon, 30 Jun 2025 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751284264; x=1751889064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xoeh3vSdh/zXf4cNHVjE6wocHe0HAHfeeqTMNqAKiQ=;
        b=iHoJ9IjLRUP9rhRYSwQdQmwpXOQjT7zbtJqCDJMvA9HtNzu6AN4Uden94/7exSBrGx
         dMIzjWRo3U1voM9bvulArG0uR+ciS2rNXt9MwJIf7XAM6jYtTTWhxAMq/0xFm+EuSNTt
         Bkwc9fc4X55DeDC9i3tJlLtoHy33nLTOemRADrIRBy8T+FaVcCT0AnfbjZh80cpmuHbx
         hGh83hZH2znzkQVceo4qWsBtVsxBSlB7Ee3SFsF+eQ1RloscsgWguTrxYZBEjjsa9Bl6
         TcSu2GdsBqbTwlE+q585WTRp6/XkNogoaLDEmmCn1ye7rSMhbTAcmhFOYnWb4UNWaeze
         hyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751284264; x=1751889064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xoeh3vSdh/zXf4cNHVjE6wocHe0HAHfeeqTMNqAKiQ=;
        b=N9nwM8eo26ZjfKmDSfGkjOqn87Pki/MZKZ6hhXq61Q1yhNh70SQYg7EHsMLncEVJ4V
         0M76Y9uXfdIscevI0N7vuDh5SUPVjq2H1oq0FEJgmHf/vuWZ/M2tW0PLj+ea7JKUcZYv
         fE+6SJ11wzkwyHD/lYlQQ5O5mt3HXLlXfhqrk/XBR/zu6TBNd6tHmeuvw7dr9eEmWRFW
         +ZRO498nIcvjTAGTjZ27eyV07JQmD3y4gWMk1If3ORF09Y78y62tCxZgQZ51xqZk0w81
         5SXptkgUX5xYLFeme+E4XpXPCPR4sEfPSnRL9gVWdoVPUqBbba9qnmA07D6tJghEBol2
         ibbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9hXSJnxgzfCfpMhiDHOsj/DcOBLnuSlHFhaLJCB8hf2ZJLpu9OXZwrVR78GYu6Ik9C9MmdHde6Bygw3Jt2gRKkkSVBQ==@vger.kernel.org, AJvYcCWSG8eU6cCkbzBehLZH5lVODsNA3nboxBscFkqBTr/3FKnplbXMiGIlh/rXfUzveuFEasHD4PYceOHOYsgd@vger.kernel.org, AJvYcCXU/eaMPd7hfDesnX1JQT8Jqg3Jzqs8q2jxfY61w3e/KoEhsdsyxuMWe9PhH7KbR+sg2QEUZeSewVF41A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGoI+rS2utZNEBxhr6yWB4YhLNrBZXa+Wg6uFecMZDOztzU00i
	WvNDDYXU/RJEmbI9Lu2kyuRr1bNLMjrO7fOobRkPU2fF7ctvy5Ljb6MgoyiA1bqshvxzFTdCSR9
	KViPyw/AL3gLLAIrEcXivKvjZ4ihlYsnCSl+QID20UA==
X-Gm-Gg: ASbGncs28DvvCRku89IWIZ8fBd526xxP6/9ywqZKUST4Te8r+gMRrE2Jnk8CTJuPqis
	YHEv8vDUc2Zk9ZbAuiN+8DVuukAznwzhQ09zZPlmUyGE8HbL529MTfcxIWyJwnZVg4MdIoNmEdP
	wwQexFjVf4zbpPZ9qmWOM4qOTpOjJmIGTSn52DmhICPtyaiVIpaeE8p9vTZwRfzj1IlckocwJbn
	DuUVQ==
X-Google-Smtp-Source: AGHT+IGN+rhauFUfuWf74k2PbBjLpYa/S/qJx6luzuDHeQnUcjKa/KznP5zozRqdEgr7gW8GbGP/N5oyJ5DRoq4EOuE=
X-Received: by 2002:a17:903:138a:b0:234:d7b2:2ac3 with SMTP id
 d9443c01a7336-23ac3dec23emr125906385ad.20.1751284264329; Mon, 30 Jun 2025
 04:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620004209.28250-1-vishnuocv@gmail.com> <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
 <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com> <bviu4igchqy6bvu54fw6afts7ooctlmmcutdq6tc4rutzhjvfs@o56kezrit6un>
In-Reply-To: <bviu4igchqy6bvu54fw6afts7ooctlmmcutdq6tc4rutzhjvfs@o56kezrit6un>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 30 Jun 2025 20:50:27 +0900
X-Gm-Features: Ac12FXyuz-BAS2ti-x32124j_cwmFRrdPpLXJrtemsXMcxWSUyeyDdI2ZZrmOhU
Message-ID: <CABxCQKvJzf1G3XLWmqngpy-Ou9U+a7Lzt6gjwZoEcU-+WL6Apw@mail.gmail.com>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap handling
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, pali@kernel.org, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, hansg@kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, jay_lee@pixart.com, 
	zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Vishnu Sankar <vsankar@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dimitry,


On Mon, Jun 30, 2025 at 2:20=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Mark,
>
> On Mon, Jun 30, 2025 at 05:42:45AM +0900, Mark Pearson wrote:
> > Hi Dmitry,
> >
> > On Fri, Jun 27, 2025, at 2:14 PM, Dmitry Torokhov wrote:
> > > Hi Vishnu,
> > >
> > > On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
> > >> Newer ThinkPads have a doubletap feature that needs to be turned
> > >> ON/OFF via the trackpoint registers.
> > >> Systems released from 2023 have doubletap disabled by default and
> > >> need the feature enabling to be useful.
> > >>
> > >> This patch introduces support for exposing and controlling the
> > >> trackpoint doubletap feature via a sysfs attribute.
> > >> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> > >> This can be toggled by an "enable" or a "disable".
> > >>
> > >> With this implemented we can remove the masking of events, and rely =
on
> > >> HW control instead, when the feature is disabled.
> > >>
> > >> Note - Early Thinkpads (pre 2015) used the same register for hysteri=
s
> > >> control, Check the FW IDs to make sure these are not affected.
> > >>
> > >> trackpoint.h is moved to linux/input/.
> > >
> > > No, please keep everything private to trackpoint.c and do not involve
> > > thinkpad_acpi driver. By doing so you are introducing unwanted
> > > dependencies (for both module loading, driver initialization, and
> > > operation) and unsafe use of non-owned pointers/dangling pointers, et=
c.
> > >
> >
> > Do you have recommendations on how to handle this case then?
> >
> > This is a Thinkpad specific feature and hence the logic for involving
> > thinkpad_acpi. There are Thinkpad hotkeys that will enable/disable the
> > trackpoint doubletap feature - so there is some linkage. I'm not sure
> > how to avoid that.
> >
> > Is there a cleaner way to do this that you'd recommend we look at
> > using? It's a feature (albeit a minor one) on the laptops that we'd
> > like to make available to Linux users.
>
> I believe if you define the doubletap as an attribute (see
> TRACKPOINT_INT_ATTR or TRACKPOINT_BIT_ATTR in
> drivers/input/mouse/trackpoint.c) then whatever process is handling the
> hot keys switching this function on or off should be able to toggle the
> behavior. The difference is that it will have to locate trackpoint node
> in /sys/bus/serio/devices/* (or maybe scan
> /sys/devices/platform/i8042/serio*) instead of expecting the attributes
> be atached to thinkpad_acpi instance.
>
> You just don't want to have one driver directly peeking into another,
> because then it starts breaking if you unbind or force use of a
> different protocol, etc.
>
> Thanks.
>
> --
> Dmitry

Thanks for the suggestion. I understand the concern about avoiding
direct driver-to-driver calls and unwanted dependencies.

Just to clarify: if we move the sysfs attribute to the trackpoint
driver itself (under /sys/bus/serio/devices/...), then thinkpad_acpi
would no longer be able to directly enable/disable the doubletap
feature in response to the Fn+G hotkey press. Don't we need userspace
to listen for the hotkey event, find the trackpoint sysfs node, and
toggle the attribute there?
That's possible, of course, but it means the feature won't work
out-of-the-box without extra userspace integration. For example, there
would be no automatic linkage between pressing Fn+G and toggling the
feature unless a udev rule or userspace daemon is configured to do it.
Or is there an approach you'd recommend to preserve the automatic
hotkey integration while avoiding the direct dependency between
thinkpad_acpi and trackpoint?
Sorry, I missed something.

Windows is utilizing this double-tap event as a Quick Launch button.


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

