Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EF4356A46
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 12:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239159AbhDGKsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 06:48:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:53008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351432AbhDGKr3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 06:47:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33FCF6108B;
        Wed,  7 Apr 2021 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617792439;
        bh=8n5JzbFmb2RaP1MmJeLHFSWOgjY+R5dimSwvY0nyTK8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=J5VeriK4gKynCyapCwWBzk3RC4dOfV5IlFSkkuidGvBkortPAUiWacnbGJJwvvHvd
         KBCluJpxMz79z6e/yJkezbCnGSaRTJiXGn5NDxgUJpTzBn2V6tL5ltTsvf3+nWlTiJ
         iXnD5pE1M8tXDIt0r8yYkoAlpbaGsk7RcbzrfYC8GVW8pouEn5dfFvXiHPc+jK5S0Y
         zNdrZT004zypSZEhhoujA1Ts+NA2/t8PBFxVx1xstpwVMZTDZet80LMvmomsStyfMX
         849M36K4XMcHACCW0bHFod0v+WoyhtFMbXW22zH9B77OdDGX4dNUZI90sPSeJwjr49
         zVLUikxNlZGag==
Date:   Wed, 7 Apr 2021 12:47:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH resend 0/3] HID: elan: Mute LED support fixes
In-Reply-To: <20210404075252.4032-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2104071246570.18270@cbobk.fhfr.pm>
References: <20210404075252.4032-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 4 Apr 2021, Hans de Goede wrote:

> Hi Jiri,
> 
> This series seems to have fallen through the cracks, can you
> please pick this up?

Sorry, it indeed did. Applied now, thanks.

-- 
Jiri Kosina
SUSE Labs

