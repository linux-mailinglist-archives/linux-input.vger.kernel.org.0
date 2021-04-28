Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E1336D6F2
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 14:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhD1ME3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 08:04:29 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49237 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhD1ME3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 08:04:29 -0400
X-Originating-IP: 78.199.60.242
Received: from [192.168.1.150] (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C804860007;
        Wed, 28 Apr 2021 12:03:42 +0000 (UTC)
Message-ID: <35bccdf42b1f6b24546d0bcb44510cfdd535de10.camel@hadess.net>
Subject: Re: [PATCH 0/7] Input: goodix - Add support for controllers without
 flash
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Date:   Wed, 28 Apr 2021 14:03:42 +0200
In-Reply-To: <20210428114608.101795-1-hdegoede@redhat.com>
References: <20210428114608.101795-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2021-04-28 at 13:46 +0200, Hans de Goede wrote:
> Hi All,
> 
> A while ago I bought a Glavey TM800A550L tablet. This is a Bay Trail
> (x86)
> tablet which comes with Android from the factory.
> 
> It is mostly just another Bay Trail tablet, but the way the Goodix
> touchscreen on it works is interesting. The controller needs to have
> firmware uploaded to it before it will work. After that it pretty
> much
> works 100% the same as any other Goodix touchscreen controller.
> 
> I've described this patch-set in the Subject as "Add support for
> controllers without flash", but I suspect that the Goodix controllers
> used on Bay Trail devices which ship with Windows pre-installed may
> also
> lack flash; and that the Windows version of the BIOS-es on these
> devices
> does the upload for us. Anyways just something which I'm wondering
> about,
> these patches are necessary to make things work regardless.
> 
> These patches should also be useful for supporting the Goodix
> controllers
> on some ARM based devices, as some of those need the OS to upload the
> firmware too AFAIK.
> 
> Note patch 7/7 is included to get an overview of the entire set.
> I'll merge that one myself through the pdx86 tree. Patches 1-6 are
> intended for merging through the input tree.


I've done a cursory review, and didn't find anything particularly
egregious. Did you check that the intermediate patches all compiled?
Feel free to add my Reviewed-by:

My only question would be where the firmware are supposed to come from
after this gets merged.

Cheers

