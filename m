Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC57373B2B
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhEEM2M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232314AbhEEM2L (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:28:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A161F611AC;
        Wed,  5 May 2021 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217635;
        bh=DiQ5O5xvSy4pcbiJ/ckScU/ZOGmwCRYyJ8aUIeZeV9I=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=RD1CXXumyHJ6oJEolAVmoYjFMaNIbJ+jIgmAxCjUfF5dXxEsKigBGAcHSca1BNWt/
         1qoilPd49nahetD2xHlELy5OEyrvTEMQSiHCX8VCUoIulaQgKe6vO9Mgr6OCBU34ms
         6h1ObD2JztvGGfIWQoOibfbTIzXBzGIUPJHTigjVxO7CQ7XYmXinv7MYLCRAJaEUfK
         JVgNqVE5WuUMSH3WdQ1FghOXqOz669X/5kaok2N2ZEEb2HqMLtJhpe5FX30jccfEK1
         cl4xM1RbRybV1p3RSXz+cWLT5smkbHtGpmUcjEEE1LRKqGRsqlqyAT9JWi5UPSuttK
         DAFzZLU5ej68w==
Date:   Wed, 5 May 2021 14:27:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add HID_QUIRK_NO_INIT_REPORTS quirk for
 Dell K15A keyboard-dock
In-Reply-To: <20210404154054.27560-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2105051427040.28378@cbobk.fhfr.pm>
References: <20210404154054.27560-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 4 Apr 2021, Hans de Goede wrote:

> Just like the K12A the Dell K15A keyboard-dock has problems with
> get_feature requests. This sometimes leads to several
> "failed to fetch feature 8" messages getting logged, after which the
> touchpad may or may not work.
> 
> Just like the K15A these errors are triggered by undocking and docking
> the tablet.
> 
> There also seem to be other problems when undocking and then docking again
> in quick succession. It seems that in this case the keyboard-controller
> still retains some power from capacitors and does not go through a
> power-on-reset leaving it in a confuses state, symptoms of this are:
> 
> 1. The USB-ids changing to 048d:8910
> 2. Failure to read the HID descriptors on the second (mouse) USB intf.
> 3. The touchpad freezing after a while
> 
> These problems can all be cleared by undocking the keyboard and waiting
> a full minute before redocking it. Unfortunately there is nothing we can
> do about this in the kernel.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

