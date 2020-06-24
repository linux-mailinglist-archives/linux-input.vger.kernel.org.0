Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FDF207F2B
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 00:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390166AbgFXWJf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 18:09:35 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33229 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387853AbgFXWJe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 18:09:34 -0400
Received: by mail-qt1-f193.google.com with SMTP id h23so3115369qtr.0;
        Wed, 24 Jun 2020 15:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version;
        bh=H/RysOR6N0zpE6c3ebPBn7+IKDXpPNRcb77mnWUMTFM=;
        b=Ny5odRbKAi5LzNa43J7hHBhF3MbPRmVRjrmvnz+U/Xkv7pV53PZdPxZik4xpgllf7s
         FC5izVUC/R3feViW1nLbeywuguz5V+rWlgU4558Z44CSgYkI/2UTFXL+qkUnTS7ydzCx
         S96ktNXHp9PnsvgaG6+XqhVbaOs+al+DvsimulCoTDpMwGoedqGOgfnK6jq9YoCGzUeH
         6a4FWCvgJr+yOZWIaWHelGodQemu8JVAjPMC20PK7o6T4ccNXyD2BgY9wtuVlnlvEc+o
         E8PHgVha5ayseyYLn38dl413xKgKdr4yMAp31YnjJvY7qHod8byMIYyDELD335ZTLFNr
         4KZA==
X-Gm-Message-State: AOAM533aRnfjifDmXiT4fDcwbNvbjXjHcnltk8kPa3D/0uoQ3tKIo0/X
        6FXnkgaKo37/xCOL54voaiU=
X-Google-Smtp-Source: ABdhPJys6wWsK6KiL7nbAlGhSwPps/gASOoCedqRYHgNRnuTH+wOUARmK+jnpjYf0Tr5DAogt1xdjQ==
X-Received: by 2002:aed:3386:: with SMTP id v6mr29626444qtd.187.1593036572579;
        Wed, 24 Jun 2020 15:09:32 -0700 (PDT)
Received: from dek-x230.localnet (pool-108-24-134-99.cmdnnj.fios.verizon.net. [108.24.134.99])
        by smtp.gmail.com with ESMTPSA id p128sm2705938qka.47.2020.06.24.15.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 15:09:31 -0700 (PDT)
From:   David Korth <gerbilsoft@gerbilsoft.com>
To:     David Rheinsberg <david.rheinsberg@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] HID: wiimote: Initialize the controller LEDs with a device ID value
Date:   Wed, 24 Jun 2020 18:05:38 -0400
Message-ID: <2498150.lGaqSPkdTl@dek-x230>
In-Reply-To: <CANq1E4T_SNUrewDQ59bonr7tTKFa=wRYwXLWHMCiNA0KN0H9Aw@mail.gmail.com>
References: <20200622225728.330-1-gerbilsoft@gerbilsoft.com> <CANq1E4T_SNUrewDQ59bonr7tTKFa=wRYwXLWHMCiNA0KN0H9Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2327861.XAFRqVoOGU"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--nextPart2327861.XAFRqVoOGU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, June 24, 2020 6:04:55 AM EDT David Rheinsberg wrote:
> Hi
> 
> On Tue, Jun 23, 2020 at 12:57 AM David Korth <gerbilsoft@gerbilsoft.com> 
wrote:
> > Based on a similar commit for Sony Sixaxis and DualShock 4 controllers:
> > HID: sony: Initialize the controller LEDs with a device ID value
> > 
> > Wii remotes have the same player LED layout as Sixaxis controllers,
> > so the wiimote setup is based on the Sixaxis code.
> 
> Please include a description of the patch in the commit-message. It
> took me quite a while to understand what the intention of this patch
> is.

Will do.

> So what you are trying is to allocate a unique ID to each connected
> wiimote, so they automatically display unique IDs, right?
> 
> Can you explain why this has to be done in the kernel driver? Why
> isn't user-space assigning the right ID? User-space needs to attach
> controllers to their respective engine anyway, in which case the IDs
> the kernel assigns would be wrong, right? How does user-space display
> the matching ID in their UI (e.g., for configuration use-cases)? The
> way you set them does not allow user-space to query the ID, does it?
> Lastly, wouldn't a device-reconnect want the same ID to be assigned
> again? With the logic you apply, user-space would have to override
> every ID for that to work.
> 
> Is there an actual use-case for this? Or is this just to align the
> driver with the other gamepads?

Most userspace programs aren't aware of controller LEDs. The only one I know 
of that is, Steam, has its own input layer and bypasses the HID drivers 
entirely.

As far as I know, there's no simple "set player ID" API that could be used to 
set a device-independent player number, so every program would need to support 
each type of controller in order to set the LEDs.

I've been manually setting the player IDs on Wii controllers when running 
multiplayer games by writing to the /sys/class/leds/ directory. Having the 
hid-wiimote driver do this itself significantly reduces setup time.

> 
> Thanks
> David
> 

--nextPart2327861.XAFRqVoOGU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBKTd2QxoniMIp2ejTC/4LR6byCgFAl7zzjIACgkQTC/4LR6b
yChVzg//X26Y6hKZxQy4cDA1rgOX4e105gYsE80z9Qwwsm4anXZNgXsZXYfhLaW0
hfgKIvM08EXszBIkVDXrKW7gO+irRmZfbZGVqMP4QTC6vr6FO3eFnGyH/NGX6QCI
/SzB0Wl23BlIujOXGNCj2I/Gs7gJ1lJ2XpMcOQQpdJwWas1DWOGhSQ36hMw0D3iF
9swjyU0HR++xg7H0B26wFgJ1ZGjC1dOvYNh8uPKPKB/Un/lN9kuSOSIowcFK17En
Wl5TN41gIKr8IoG2EZ0EKaDLM5tdrmcdrcmQV7Qg+U/fLRZPdrrHslO8tHZhy9pc
ldnIYbCEJ5mFBdkCDl9zaUTKXhx4dwSTqpLcFNVjnYEk8roxgk+Ur6tVwbiZs8Xd
TOUfzuvzyIE7yaRiUXVDQo+zgtKVj7wcLHMhPkhngMYmYWSq3Jrpw3zePxDtitdd
kE6mWZmNgnrnJFjjAVp5gnTxdSQeT3bz5PH8PTEwXW6jSE+6dbuIoPQu6ONW2PRi
LlntfKBuqaDOU0Jbqrw/HxQsdupLNNHSi1l9SoGt3C8ET5sW9cd1SuBzDM8uaLK1
AxhObrHrSWa0iIj64bB1QCEvghVYAg+Xqe6V1hMfdoDdg8EF3QmQFM7j0VEbXkdx
/Cn53xTl4GkSWxnJPD3essXj4VnBSLRJKYouZkG15l5MsSZPMDQ=
=F17s
-----END PGP SIGNATURE-----

--nextPart2327861.XAFRqVoOGU--



