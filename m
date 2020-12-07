Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913582D147C
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 16:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgLGPNt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 10:13:49 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35879 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgLGPNt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 10:13:49 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 28B2AE0002;
        Mon,  7 Dec 2020 15:13:06 +0000 (UTC)
Message-ID: <51f85699a86b751869689b3776ddf8e302131e95.camel@hadess.net>
Subject: Re: [PATCH] Input: goodix - Add upside-down quirk for Teclast X98
 Pro tablet
From:   Bastien Nocera <hadess@hadess.net>
To:     linux@simonmicro.de, linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Mon, 07 Dec 2020 16:13:06 +0100
In-Reply-To: <672ddee0a276be7d34e01c665df20d1c8ad2b7d0.camel@hadess.net>
References: <20201117004253.27A5A27EFD@localhost>
         <672ddee0a276be7d34e01c665df20d1c8ad2b7d0.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-11-17 at 16:05 +0100, Bastien Nocera wrote:
> On Mon, 2020-11-16 at 19:42 -0500, Simon Beginn wrote:
> > The touchscreen on the Teclast x98 Pro is also mounted upside-down
> > in
> > relation to the display orientation. I added it also to the list of
> > those devices. Verified it works on my device - this has not been
> > tested with more users than myself...
> 
> Looks good to me, thanks.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

Dmitry, this seems to have slipped through the cracks. Can you please
pick it up for the next merge window?

Cheers

