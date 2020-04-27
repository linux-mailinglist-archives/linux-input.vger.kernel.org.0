Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC03A1B9AE4
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 10:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgD0I4k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 04:56:40 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48525 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgD0I4j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 04:56:39 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AE3F9C0010;
        Mon, 27 Apr 2020 08:56:35 +0000 (UTC)
Message-ID: <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
Subject: Re: [PATCH v11 00/11] HID: nintendo
From:   Bastien Nocera <hadess@hadess.net>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>
Date:   Mon, 27 Apr 2020 10:56:34 +0200
In-Reply-To: <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
         <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
         <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
         <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
         <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2020-04-26 at 15:31 -0700, Roderick Colenbrander wrote:
> On Sun, Apr 26, 2020 at 2:14 PM Bastien Nocera <hadess@hadess.net>
> wrote:
> > On Sun, 2020-04-26 at 13:42 -0700, Roderick Colenbrander wrote:
> > <snip>
> > > I really wonder how a device like this should be handled. It
> > > looks
> > > like the device can also handle a bunch of other classic Nintendo
> > > controllers.
> > > 
> > > Is there anyway of detection this adapter? It feels nasty to have
> > > to
> > > hack in quirks for this device...
> > 
> > The end game isn't very different from how we handle XBox 360, or
> > PS3/PS4 "clone" devices.
> > 
> > Those devices (the adapters) work on the actual Nintendo Switch
> > hardware, so should probably work with the driver that handles the
> > same
> > type of hardware on Linux.
> > 
> 
> (resend in plain text)
> 
> I agree it probably makes sense to handle in this driver. I'm worried
> about the application level implications. We have been doing a lot of
> work e.g. on Android to try to make gamepads consistent. It is weird
> to have a "Switch controller" with different features as applications
> make assumptions and don't expect there to be multiple versions of a
> particular controller. Any button mapping files would potentially be
> wrong for those too, certain features are not there (e.g. no sensors
> or no lights or rumble) or if they are the behaviour is different
> (e.g. HD rumble vs a classic rumble motor).
> 
> Ideally we would do some kind of "fixup" to change the device name
> and
> or replace the device ids to at least separate them.

All those would be detectable at runtime. I'm not sure that it's ever a
good idea to presume that a particular VID/PID combination will have,
say, rumble and LEDs available when the driver can answer those
questions.

For example, I'm not sure that those controllers have either features
(though I'm not certain they identify as Switch Pro controllers, but
for the sake of argument):
https://store.nintendo.com/super-nintendo-entertainment-system-controller.html
https://store.nintendo.com/nintendo-entertainment-system-controllers.html

Cheers

