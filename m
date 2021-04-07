Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D09B356CC2
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 14:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243639AbhDGM4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 08:56:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235427AbhDGM4c (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 08:56:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D381C6113A;
        Wed,  7 Apr 2021 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617800183;
        bh=QUB4pck51+wHts40LZWRJu2bXwRRaVU2ooeuruYMWdY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ida9hAnX6z+OMSIV4abCMF1CQ7VwzMNhCJ5wnjCn9xPQzztgloMs7Qt0q98LcnPWv
         kCS67OFN3d0uWB8+HOLnNxtL0Ao8TrLuV6ltPdveCuzbWLABT1GBKaKp6O0H+z2q2M
         cPcui9UZjdVwqp7J4Cm14VHnh7D+cmYJwBYwaOAblczQk7h8AIX+DXpqNTWRVkszCK
         Z1bgfVux4F9Wjnc4jkAmB/jJhp1OeKQfr/iBiriQLD0vcW8jeQuWdd/SuEeW5VSFcc
         nuTOnfeu5h5MoskU5xWm0UfRWPE47K1uc6cwmOq5IDV7Nxn1XrJlh7bTTU6a1TlCU2
         cCcYAbCn0znZg==
Date:   Wed, 7 Apr 2021 14:56:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>,
        Pavel Machek <pavel@ucw.cz>,
        =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 resend 0/9] HID: lenovo: LED fixes and Thinkpad X1
 Tablet kbd support
In-Reply-To: <20210404080432.4322-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2104071250530.18270@cbobk.fhfr.pm>
References: <20210404080432.4322-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 4 Apr 2021, Hans de Goede wrote:

> Hi Jiri,
> 
> This seems to have fallen through the cracks, again (IIRC this is the
> second resend) can you please pick this series up?
> 
> Patches 1 - 7 have:
> Reviewed-by: Marek Behún <kabel@kernel.org>
> 
> Patches 1, 4, 5, 7 have:
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> With the ack from Pavel (the LED subsys maintainer) indicating that
> there are no problems with the LED classdev API usage in these patches.
> 
> Patches 8 - 9 are new in v2 of this series, these add support for the
> Thinkpad X1 Tablet Thin keyboard. They have been tested by me on a
> Thinkpad 10 ultra keyboard dock (so that that does not regress) and
> by Alexander Kobel on a Thinkpad X1 Tablet Thin keyboard.

Now in for-5.13/lenovo, sorry for the delay and thanks.

-- 
Jiri Kosina
SUSE Labs

