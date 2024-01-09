Return-Path: <linux-input+bounces-1189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD348287E8
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 15:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5A1286733
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 14:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D88A39876;
	Tue,  9 Jan 2024 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FaByO4AF"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B63986F
	for <linux-input@vger.kernel.org>; Tue,  9 Jan 2024 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704809899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3THNFHQS5wwo4cI4QVHpCKin2eJ0VsiVpReOMSRKkw=;
	b=FaByO4AFMIloAe0Lx4OWS9QUBDg6Klz+ULPtzq0axKDMjaHfJETY1lGdnnKYkz0VuR86t7
	zdV7IvFLDSpyQ/M6O8USNurgobC0FgXn2FddppIkoSIQq1XsqMT7d6OAd3+4t8oAMJGFq/
	PoF8mAC/ox/31EfnzDd9cnpSwUuaEX0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-9Ql2OWIBPRaTbTlA4OI4WA-1; Tue, 09 Jan 2024 09:18:18 -0500
X-MC-Unique: 9Ql2OWIBPRaTbTlA4OI4WA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-554acc951faso1941075a12.2
        for <linux-input@vger.kernel.org>; Tue, 09 Jan 2024 06:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704809897; x=1705414697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3THNFHQS5wwo4cI4QVHpCKin2eJ0VsiVpReOMSRKkw=;
        b=Ur+p8Ubpy2+yorkuEAOpQqFGpr+u2L333Be5nKiYoPOqjmKR6kDRq1MiRxLahfpzya
         ru24fh/xhuGOTrcEVr+G06TwHE0YHW+tL7MC3Ea3Id8+r3IUzHb1TnOcevz7p7nAm0QP
         xd7H6A2/YCoPH7zICXBzU52qWQAisM/A7nwq5pQrgcuOJo7WgOkZsPzgR8uCjw4lYX8g
         ZKuzSYb94MIVqvkAIuVd/UECBIOuF3SRbg/x7sIA6DPHgAzqRYsh/0pzYgLI4lZ+V93/
         qP19kRxg6oWMmPzRk7F2qPEMrpKUnSsyKdxx8Aaq8u35N2XJoFE4OsvH3KOEYa/HZb7K
         cT+Q==
X-Gm-Message-State: AOJu0Yw98pog+oMvg37TUvzwll+Ef2DEkr1XlVFwDoRwLsHjWsRNw5aX
	LxP24K5Wfi7FVAVd+EzrPbpHs80WrRSLOl+Vapo+JthvDymJlUxXFisoKQ1vmAG+atSn0V7LwB8
	BQMO+o0wLkEBbDSCe5T+4TGRNvDkGX3Meht9i6eJtdCHa3FQ=
X-Received: by 2002:a50:a69a:0:b0:557:17d5:9afe with SMTP id e26-20020a50a69a000000b0055717d59afemr2594693edc.66.1704809897181;
        Tue, 09 Jan 2024 06:18:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnxz/MmvkNTxaoNNw0HTzCCSkv+92BVZ2g1k8dn0fX+gCCKNB5Cu4wEGfVWClLdQrqXvDCk1kHOD1FtOQuk7Q=
X-Received: by 2002:a50:a69a:0:b0:557:17d5:9afe with SMTP id
 e26-20020a50a69a000000b0055717d59afemr2594687edc.66.1704809896861; Tue, 09
 Jan 2024 06:18:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3277085.44csPzL39Z@natalenko.name> <824573bb-ae01-41b9-8f97-a760ae8f3f18@redhat.com>
In-Reply-To: <824573bb-ae01-41b9-8f97-a760ae8f3f18@redhat.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 9 Jan 2024 15:18:05 +0100
Message-ID: <CAO-hwJ+GLVYzYKUv=NyhEVb-_h_3NAstv6sjL8stqDMkS98j+w@mail.gmail.com>
Subject: Re: Flood of logitech-hidpp-device messages in v6.7
To: Hans de Goede <hdegoede@redhat.com>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 12:58=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Oleksandr,
>
> On 1/9/24 12:45, Oleksandr Natalenko wrote:
> > Hello Hans et al.
> >
> > Starting from v6.7 release I get the following messages repeating in `d=
mesg` regularly:
> >
> > ```
> > Jan 09 10:05:06 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: Disconnected
> > Jan 09 10:07:15 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: Disconnected
> > Jan 09 10:16:51 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: HID++ 4.5 device connected.
> > Jan 09 10:16:55 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: HID++ 4.5 device connected.
> > Jan 09 10:16:55 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: HID++ 4.5 device connected.
> > Jan 09 10:36:31 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: Disconnected
> > Jan 09 10:37:07 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: HID++ 4.5 device connected.
> > Jan 09 10:46:21 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: Disconnected
> > Jan 09 10:48:23 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: Disconnected
> > Jan 09 11:12:27 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: HID++ 4.5 device connected.
> > Jan 09 11:12:47 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: HID++ 4.5 device connected.
> > Jan 09 11:12:47 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: HID++ 4.5 device connected.
> > Jan 09 11:38:32 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: Disconnected
> > Jan 09 11:43:32 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: Disconnected
> > Jan 09 11:45:10 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: HID++ 4.5 device connected.
> > Jan 09 11:45:11 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: HID++ 4.5 device connected.
> > Jan 09 11:45:11 spock kernel: logitech-hidpp-device 0003:046D:408A.0005=
: HID++ 4.5 device connected.
> > Jan 09 12:31:48 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: Disconnected
> > Jan 09 12:33:21 spock kernel: logitech-hidpp-device 0003:046D:4051.0006=
: HID++ 4.5 device connected.
> > ```
> >
> > I've got the following hardware:
> >
> > * Bus 006 Device 004: ID 046d:c52b Logitech, Inc. Unifying Receiver
> > * Logitech MX Keys
> > * Logitech M510v2
> >
> > With v6.6 I do not get those messages.
> >
> > I think this is related to 680ee411a98e ("HID: logitech-hidpp: Fix conn=
ect event race").
> >
> > My speculation is that some of the devices enter powersaving state afte=
r being idle for some time (5 mins?), and then wake up and reconnect once I=
 touch either keyboard or mouse. I should highlight that everything works j=
ust fine, it is the flood of messages that worries me.
> >
> > Is it expected?
>
> Yes this is expected, looking at your logs I see about 10 messages per
> hour which IMHO is not that bad.
>
> I guess we could change things to track we have logged the connect
> message once and if yes then log future connect messages (and all
> disconnect messages) at debug level.


Sounds reasonable to me.

Cheers,
Benjamin


>
>
> Jiri, Benjamin, do you have any opinion on this ?
>
> Regards,
>
> Hans
>
>
>


