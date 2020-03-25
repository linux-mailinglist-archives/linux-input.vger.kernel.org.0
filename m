Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFDD192AB7
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 15:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgCYODC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 10:03:02 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58977 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbgCYODC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 10:03:02 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2C5A6FF812;
        Wed, 25 Mar 2020 14:02:58 +0000 (UTC)
Message-ID: <be555dbf9c8508c5b8d9ed561384c66d76326241.camel@hadess.net>
Subject: Re: [PATCH] Input: goodix - Fix compilation when ACPI support is
 disabled
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
Date:   Wed, 25 Mar 2020 15:02:58 +0100
In-Reply-To: <5aca9fe9-3751-f0f6-9851-5d9a0c048388@redhat.com>
References: <20200325103348.108792-1-hdegoede@redhat.com>
         <9f4df3fdc54448728582ea35f4d3a08411f6aba5.camel@hadess.net>
         <6611fe58-8e3d-d443-9dd1-6ed9086fa752@redhat.com>
         <1db6a35732a2c191ff56043f1ae357d8ae1b5b10.camel@hadess.net>
         <5aca9fe9-3751-f0f6-9851-5d9a0c048388@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 (3.36.0-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-03-25 at 14:55 +0100, Hans de Goede wrote:
> We could do something like that, but TBH I'm not a fan of that
> 
> adding extra wrappers makes it harder to see what the code is
> 
> actually doing.
> 
> 
> 
> I understand your dislike for the extra braces I added and
> 
> I'm fine with fixing that by adding __maybe_unused to the
> 
> variable declarations at the top. I don't really see what
> 
> the problem with the #ifdef-s is given how clean they are,
> 
> with the braces thing fixed by using __maybe_unused things
> 
> would look like e.g. this:

It's not only the fact that there's extra #ifdef's, it's that the
ifdef's need to be just "that". It's not "#ifdef FOO", it's "#if
defined CONFIG_X86 && defined CONFIG_ACPI".

I'd really prefer a separate function(s) that would be the only
place(s) where the conditions would be, and with one-liner bodies, to
work-around the fact that those ACPI calls are only really half-
stubbed.

