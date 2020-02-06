Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6CF71540F9
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 10:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgBFJOX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 04:14:23 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:60913 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgBFJOX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 04:14:23 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 46D46200003;
        Thu,  6 Feb 2020 09:14:18 +0000 (UTC)
Message-ID: <6ed9447de70d49289ded71751e57923d0c4ab3b4.camel@hadess.net>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
From:   Bastien Nocera <hadess@hadess.net>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Martyn Welch <martyn@welchs.me.uk>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Conn O'Griofa <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Date:   Thu, 06 Feb 2020 10:14:17 +0100
In-Reply-To: <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
References: <20200126194513.6359-1-martyn@welchs.me.uk>
         <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
         <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
         <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-01-28 at 22:22 -0800, Roderick Colenbrander wrote:
> As you can see this creates an awkward situation. I'm sure there
> other
> such devices as well e.g. counterfeit Logitech keyboards, USB serial
> adapters and other periperhals with similar challenges. In an ideal
> world the support would live in another driver, but since in case of
> this "fake" PS3 controller it "share" our product / vendor ids it is
> tricky. At this point there is not a strong enough case yet to
> augment
> the "hid-quirks" to do so, but perhaps if it became a serious issue
> (e.g. for newer controllers) maybe we need to think of something.

I'm pretty certain that the only reason why those use "fake" VID/PID
combinations is because that's the only thing the consoles will
accept. 

That's par for the course when you try to close off your ecosystem that
those that try to enter it will use the means at their disposal to do
that.

