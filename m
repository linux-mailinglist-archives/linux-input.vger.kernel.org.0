Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840DD45712F
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 15:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhKSOyb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 09:54:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:44594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230373AbhKSOyb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 09:54:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A03C615E2;
        Fri, 19 Nov 2021 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637333489;
        bh=j9EvNULSeExcNiJnlS4N6+GKZ3vnTB5OWL9E8viaCk4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=caP+9asJxHK2CRkXHz74HO7ZC0eu2imeOWWSqhcpbsAbOZo4KGlJO2BM275yHJkEv
         CpqmSRECbWNRIC9xyqJyoh0Kp4y0KqeMG50Wx/wihpsdQXi5mDbm2B/Xm9dOASXVOe
         HGx6aGVF8DQyYl6j0MDZGuRKAxDZB8TFRv9Hki1Uy8riFpz6x4VT1bISnzMMDsYfpP
         TMgiVZYs+XAu5O6AYR77+I1QRIJLrBJcyi9NBhm3KgHqJfOryGf58I86V4Ft98BAoh
         8bAZ5IZ3Len+hIhYpclHVJVyGb7FCPOw2myaKBvzHYl/yxKy63gGhhe1LKSHOht8vo
         PgwaUHbj7UJPA==
Date:   Fri, 19 Nov 2021 15:51:27 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Trevor Davenport <trevor.davenport@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: Ignore battery for Elan touchscreen on HP Envy X360
 15-eu0xxx
In-Reply-To: <20211103064024.23047-1-trevor.davenport@gmail.com>
Message-ID: <nycvar.YFH.7.76.2111191551200.16505@cbobk.fhfr.pm>
References: <20211103064024.23047-1-trevor.davenport@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 3 Nov 2021, Trevor Davenport wrote:

> Battery status is reported for the HP Envy X360 Convertible 15-eu0xxx
> even if it does not have a battery. Prevent it from always reporting the
> battery as low.
> 
> Signed-off-by: Trevor Davenport <trevor.davenport@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

