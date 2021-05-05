Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0894373B31
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhEEM3Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:29:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:33762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232577AbhEEM3X (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:29:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D190613B3;
        Wed,  5 May 2021 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217707;
        bh=nnoUyV6w1xAIR6P9TGr/Je7lKmviC1pu5rkYtnQVEdg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=I4/z1Vg/f/3bzjL/JA45PDbnIWRVe/k6oAKBEX2ZiV591UJas2L+sC0yFBc76He+I
         4nTYefsT//8hg3kH9wDGQ5NOa395QIEANRXS6ikqOcJkTXhNIRRDbl5FIDztbd5sVg
         Kd6Kw5CsWqCadt9tAlfRAHeWf+xG7SYI3sRAwtyreJ8c8r05QiTUoPBgunt9w2a38z
         XwhIWOs1763/HceO895O3PSVHH2yK1iqiVpY1DgnwnuNYRhCpNwNykKuTeBCOs0zxc
         Wi4E2/VS2Na+4cC7Yn4jQ2nMfV/H7K1cBjCZ6WMnwhVcWr03wtCyZSyEtyk213sbhx
         ya2RSJheNGqSw==
Date:   Wed, 5 May 2021 14:28:24 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj/hidpp: Add info/warn/err messages about
 27 MHz keyboard encryption
In-Reply-To: <20210404185609.5120-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2105051428140.28378@cbobk.fhfr.pm>
References: <20210404185609.5120-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 4 Apr 2021, Hans de Goede wrote:

> By default 27 MHz Logitech keyboards send the keypresses to the receiver
> in plain text. Logitech's Windows "Keyboard and Mouse settings" tool allows
> configuring encryption for the keyboard wireless link.
> 
> Now there also is a Linux tool for setting this up:
> https://gitlab.freedesktop.org/jwrdegoede/logitech-27mhz-keyboard-encryption-setup
> 
> Once a keyboard is paired in encrypted mode, it will no longer work with
> any receiver other then the receiver it was paired with.
> If a user accidentally tries to pair another keyboard with the receiver
> with which a keyboard has been paired in encrypted mode, then the receiver
> looses the encryption key and the originally paired keyboard will no longer
> work with either that receiver, or another receiver until the keyboard's
> encryption key is rewritten by another encrypted mode pairing using the
> tool. Or until it is reset by following a special reset procedure.
> 
> This commit adds 3 new log messages related to 27 MHz keyboard link
> encryption to the Logitech dj / hidpp drivers:
> 
> 1. An info level message when keyboard encryption is being used
> 2. A warning message when keyboard encryption is not used
> 3. An error message when the encryption key has been lost and the
>    keyboard will not work because of this
> 
> Messages 2. and 3. contain a link to the userspace tool to setup the
> encryption. The linked page also contains instructions to clear the key
> (without needing the tool) to help a user recover from the keyboard not
> working in case 3.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you Hans.

-- 
Jiri Kosina
SUSE Labs

