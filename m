Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEB745710C
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhKSOux (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 09:50:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:41430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233567AbhKSOuw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 09:50:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D74C061A07;
        Fri, 19 Nov 2021 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637333270;
        bh=w9NGYmWakKw9KnL2OqY+cObClqX3qpTxSzvIarbmPPw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=O4EGJj2r0yQWzRpWSDZ/o4BYjik2lUGvXq8n0znJ1NYV2qCMKMGdbX6F/l5vhZxQv
         /IaGa3hs0PAR1/N/bf+y1BRYgInA501P/x0ChktbbAfNQwq+LGo8ofgP6nTGA3nso1
         2JkPXU2+plxZfbEvyHf3IKO/L0sixltUlcjdRaGJtl1vH5QRvfSPUOqpnHFyBjIonX
         kafpRzZW0cGK+ewYI70B9YcHNSxUqCdF9Ewr0UAOcBt1nhIg9Sw/IFJXnOxg5GdSgi
         hXebFtIKLjRKNvLMpNip1NPumhKqugHipxJ4Alu6Bsz2/9zWxF9fm7GrWnpT/uVALF
         JvwG1N3yPXgKQ==
Date:   Fri, 19 Nov 2021 15:47:47 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        Benjamin Tissoires <btissoir@redhat.com>
Subject: Re: [PATCH] HID: input: Fix parsing of HID_CP_CONSUMER_CONTROL
 fields
In-Reply-To: <20211028163330.503146-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2111191547400.16505@cbobk.fhfr.pm>
References: <20211028163330.503146-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 28 Oct 2021, Hans de Goede wrote:

> Fix parsing of HID_CP_CONSUMER_CONTROL fields which are not in
> the HID_CP_PROGRAMMABLEBUTTONS collection.
> 
> Fixes: bcfa8d14570d ("HID: input: Add support for Programmable Buttons")
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2018096
> Cc: Thomas Weißschuh <linux@weissschuh.net>
> Suggested-by: Benjamin Tissoires <btissoir@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

