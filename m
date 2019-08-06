Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCB01837D0
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 19:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731696AbfHFRYa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 13:24:30 -0400
Received: from ms.lwn.net ([45.79.88.28]:45064 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729161AbfHFRYa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Aug 2019 13:24:30 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B1B26728;
        Tue,  6 Aug 2019 17:24:29 +0000 (UTC)
Date:   Tue, 6 Aug 2019 11:24:28 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Colin King <colin.king@canonical.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: docs: fix spelling mistake "potocol" ->
 "protocol"
Message-ID: <20190806112428.3ab5d604@lwn.net>
In-Reply-To: <20190805104951.26947-1-colin.king@canonical.com>
References: <20190805104951.26947-1-colin.king@canonical.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon,  5 Aug 2019 11:49:51 +0100
Colin King <colin.king@canonical.com> wrote:

> There is a minor spelling mistake in the documentation, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  Documentation/input/multi-touch-protocol.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/input/multi-touch-protocol.rst b/Documentation/input/multi-touch-protocol.rst
> index 6be70342e709..307fe22d9668 100644
> --- a/Documentation/input/multi-touch-protocol.rst
> +++ b/Documentation/input/multi-touch-protocol.rst
> @@ -23,7 +23,7 @@ devices capable of tracking identifiable contacts (type B), the protocol
>  describes how to send updates for individual contacts via event slots.
>  
>  .. note::
> -   MT potocol type A is obsolete, all kernel drivers have been
> +   MT protocol type A is obsolete, all kernel drivers have been
>     converted to use type B.

Applied, thanks.

jon
