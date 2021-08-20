Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509333F2C8D
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238510AbhHTM5R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:57:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:41286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240375AbhHTM5Q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:57:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5575160F6F;
        Fri, 20 Aug 2021 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629464199;
        bh=gUESHUkiZ228u3DfqWKmqMxLKIHRILfd5R0lQQ5ZsL8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Btx5Smx1p+Ijqs24kmiYgDq9OWhhLqnFRsfKKYKE12t3ZkQeyyCwURNUKcQOY+3WG
         kYg5puv25dFMhKXBRPAHNabP27NKvy4kz448rOspWY1PqEEHNSo2aCrXjJrEM83nmX
         VAf1dMtu+3OurzLkP86iQtPgoiodRh2yvxIL3RnsgmV2ygeuWjxldQYUcbcnOlc5Oj
         gBAWtXsTHaNR6zQNIDFJ9Wbx9pxLUYfE2//o2vk+Hghk4rxY2PT1q7wRMhUfUAZyDk
         zIh5kOLE8SUFfnjKQ+xcet4VriXWmAgSTTkJelHRnoA95vJm+WsrHe5nRKCqGvsiRC
         pe1l7WEDAfVkg==
Date:   Fri, 20 Aug 2021 14:56:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pascal Giard <pascal.giard@etsmtl.ca>
Subject: Re: [PATCH v2] HID: sony: support for the ghlive ps4 dongles
In-Reply-To: <20210810140932.6652-1-daniel.nguyen.1@ens.etsmtl.ca>
Message-ID: <nycvar.YFH.7.76.2108201456270.15313@cbobk.fhfr.pm>
References: <20210810140932.6652-1-daniel.nguyen.1@ens.etsmtl.ca>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Aug 2021, Daniel Nguyen wrote:

> This commit adds support for the Guitar Hero Live PS4 dongles.
> 
> These dongles require a "magic" USB control message to be sent
> every 8 seconds otherwise the dongle will not report events where
> the strumbar is hit while a fret is being held.
> 
> Note that the GHL_GUITAR_POKE_INTERVAL is reduced to 8 seconds in order
> to support PS3, Wii U, and PS4 GHL dongles.
> 
> Also note that the constant for vendor id 0x1430 has been renamed from
> Activision to RedOctane as self-declared by the device.
> 
> Co-developed-by: Pascal Giard <pascal.giard@etsmtl.ca>
> Signed-off-by: Pascal Giard <pascal.giard@etsmtl.ca>
> Signed-off-by: Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
> ---
> 
> Changes in v2:
> * Substituted interrupt messages for control messages
> * Removed static const magic value because it will be auto-generated

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

