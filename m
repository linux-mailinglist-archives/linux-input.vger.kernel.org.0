Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D51F1B9428
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 23:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgDZVO7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 17:14:59 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56701 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgDZVO7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 17:14:59 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9F4BF240002;
        Sun, 26 Apr 2020 21:14:55 +0000 (UTC)
Message-ID: <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
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
Date:   Sun, 26 Apr 2020 23:14:55 +0200
In-Reply-To: <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
         <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
         <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2020-04-26 at 13:42 -0700, Roderick Colenbrander wrote:
> 
<snip>
> I really wonder how a device like this should be handled. It looks
> like the device can also handle a bunch of other classic Nintendo
> controllers.
> 
> Is there anyway of detection this adapter? It feels nasty to have to
> hack in quirks for this device...

The end game isn't very different from how we handle XBox 360, or
PS3/PS4 "clone" devices.

Those devices (the adapters) work on the actual Nintendo Switch
hardware, so should probably work with the driver that handles the same
type of hardware on Linux.

