Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08DCDD4379
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 16:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfJKOxj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 10:53:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35566 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726631AbfJKOxj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 10:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570805618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0gWaQdKujjo5Z3ROPjLS3LoyD2z5QHy/ABRibObpfXs=;
        b=L+DDTa3RggeohkCFAyg/yPBCbv9pKFCI+V8qxfPPdBrQrBHnZMZGWmQB8JwHe3N8NLnxY3
        PVt6AaMHgmwwh7D74Sl7oYf789OUCUquPNfdlS/FMYtu+dusyidjmmwxl4OFWxZoOLjFSb
        6UaU10IS4+LyQeB9yZxpeqIC1QTOL+8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-HnbOmS_yO9G3EfwUJdYSaw-1; Fri, 11 Oct 2019 10:53:36 -0400
Received: by mail-qt1-f198.google.com with SMTP id f15so9656579qth.6
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 07:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4I7np6p5oqe7yeeh//OBr5xu9S8MBxRhjeAjpR7a98I=;
        b=gK1a4LRkMKm9WaICiyzDWDyzR5RyEedE8VBJcHUsSN2jW3YiuOcOXX5wWvP8A/S5Ma
         m0Px/+2FErXR4yK8kPxX7BATEm6lK43ObW5ArmwW+jIfHAOL2alcOz1Mpz9o9RL7g6Z8
         J4uGG0jYoiupXJP6FCRFlqcBGeEPAFRT2U2vFSLZlLIajmQOeCena1CHZxuJmbVh1jnO
         7Lr4Ju6X3DtQ1Z2dsaTl7VPv7EBzSwLRGDeeuvMB3c+G/VBcYzMN0mHI0EDL9GH/2qRA
         BNWA4JO/x1X6GTN6sOZTMa+bVts281BPyaxz/J0KlYTNnmEZY31ut16+B/AZof3l4Mkx
         RZ4A==
X-Gm-Message-State: APjAAAVTaMJmylPfcRxvgnipTCLkATUaXQtlOM1HIxn0vHJE0DOKAI61
        KEFKVb7DMmrXyyHjYXBUwKzjGyVANV7vJZsZ6c0HrFzm4vkKqlivEm+DvhqITOSL00gr8idw9VZ
        A6zGxY37exBZ1OMPSGNzEuhwjhUQvqY1g/brH4Nk=
X-Received: by 2002:a0c:fc4a:: with SMTP id w10mr16601140qvp.46.1570805616118;
        Fri, 11 Oct 2019 07:53:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGwQJCiAxjvuWtw/ewNFYWdVm3XJoE5QGghOEG7vmbVbwQO+m3I3TFA5aGujRnet5l8V8u+HrcAzmhv1JM2xw=
X-Received: by 2002:a0c:fc4a:: with SMTP id w10mr16601121qvp.46.1570805615825;
 Fri, 11 Oct 2019 07:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191007051240.4410-1-andrew.smirnov@gmail.com>
In-Reply-To: <20191007051240.4410-1-andrew.smirnov@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 16:53:24 +0200
Message-ID: <CAO-hwJ+=pDmvPbLVO8mViygJof7O1YeX3KO951nqN4dNaKz83g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Logitech G920 fixes
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Bazely <sambazley@fastmail.com>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
X-MC-Unique: HnbOmS_yO9G3EfwUJdYSaw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Finally, someone who takes care of the G920!
Note that when I sent my first initial version that Hans reused, I
surely broke it (looking at your patch 3/3), but no one cared to test
it :(

On Mon, Oct 7, 2019 at 7:13 AM Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>
> Everyone:
>
> This series contains patches to fix a couple of regressions in G920
> wheel support by hid-logitech-hidpp driver. Without the patches the
> wheel remains stuck in autocentering mode ("resisting" any attempt to
> trun) as well as missing support for any FF action.

So, you are talking about regressions, and for that I would like to be
able to push the patches to stable.

However, I would need more information:
- patch 3/3 seems simple enough to go in stable, and is clearly a
regression from the recent series. Can you put it in first and add
stable@vger.kernel.org in a CC field (and possibly with a Fixes tag as
well)?
- I am not sure which patch fixes the wheel remains stuck in
autocentering mode. Is it patch 2/3?
- was the "wheel remains stuck in autocentering mode" bug present from
on of the recent patch or was it always there since we introduced
support in hid-logitech-hidpp, but the game would need to unlock the
wheel first?

So all in all, can you:
- drop the first patch and push it in a later series
- re-order the patches: 3/3 then 2/3
- tell me when the wheel is not stuck when the series is applied
(after 3/3 or 2/3), and make a note in the commit message with that
information
- take into account my comments in the first patch you submitted (that
I just sent).

Cheers,
Benjamin


>
> Thanks,
> Andrey Smirnov
>
> Andrey Smirnov (3):
>   HID: logitech-hidpp: use devres to manage FF private data
>   HID: logitech-hidpp: split g920_get_config()
>   HID: logitech-hidpp: add G920 device validation quirk
>
>  drivers/hid/hid-logitech-hidpp.c | 193 +++++++++++++++++++------------
>  1 file changed, 120 insertions(+), 73 deletions(-)
>
> --
> 2.21.0
>

