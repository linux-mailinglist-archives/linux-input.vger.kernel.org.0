Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2135C373B92
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhEEMlB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:41:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232019AbhEEMlB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:41:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20CC1608FE;
        Wed,  5 May 2021 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620218405;
        bh=IO50buX3ruWyeEriZ1RvrpQnE/VghzsWT9srr7tHe+c=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=c0znP9suMvauNLpFEEhSukcmjDSHz9s+hFxEbILI5cghjzeNcRlRSB1fv4jHDIQOd
         5jzFgtToahUEXJDcck++eFTQKey1A/hbIFJ+xeenctG8glhJ22KXNHs2kMMUy6A/2y
         z2Me7SMILZmrWHJbnyYZF/UBVRjJpEFAcAAhIYqFF6vmSKUowi4DT2sOqtUsEODOKP
         7rZvq8oqaKE7nr8WiUwYSQypJ+AEu4D0ek/Orf3uX05/BKeiNcouDwIZ4PMtY2TP0u
         XXENpo25LFaEhLNpiv36tymRi+IA17QVszdN/uiJ4HsuPvKp8BFYCypd2I54gPygAT
         vKHme/j57/6HA==
Date:   Wed, 5 May 2021 14:40:02 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hoeg <peter@hoeg.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/6] HID: lg-g15: Add support for the Logitech Z-10
 speakers
In-Reply-To: <20210416131323.233184-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2105051439480.28378@cbobk.fhfr.pm>
References: <20210416131323.233184-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 16 Apr 2021, Hans de Goede wrote:

> Hi All,
> 
> Here is a patch series adding support for the LCD menu keys +
> LCD brightness control on the Logitech Z-10 speakers (with LCD)
> which use the same protocol as the G15 keyboards.
> 
> The first patch is an unrelated cleanup, patches 2-4 move some code
> into helper functions to allow re-use in the Z-10 case, patch 5
> adds the actual Z-10 support and patch 6 is a bonus patch adding
> missing MODULE_AUTHOR tags to 2 HID drivers which I maintain.

Series now in for-5.14/logitech. Thanks,

-- 
Jiri Kosina
SUSE Labs

