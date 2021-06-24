Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240423B3046
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 15:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhFXNn5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 09:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:32928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229995AbhFXNn5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 09:43:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EBB4613DC;
        Thu, 24 Jun 2021 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624542098;
        bh=Q5XRw5adCPiypuyfJm2Co5msCh8O+vpMzbd2IR4nRVQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Lxm30UuqsD3x3QIxS/+whFGWM8MZ5TVS8XfAbeii9nTTpojKCNiSuXQenKP89SSrC
         QBBdX07zCuVyPZxTiITVDKxAGbsluHSXjaXlMzYnqYw30uPP3QdddLad3fKIOSDJYn
         qM5OIrtV0/DS/9J7wo7zMpydVKMEWz4hEixW8XbGkBIX1DCfk319GGWYUCAXhGiS3c
         tKRROSmQjParnI+Jrvj/AnC6rUg41dRWksMO7DOkMXnMacyOD8Uq+eLOUyiDZtSDpF
         Pdr2KWOOEWfdrJGXyXEqvL0cB8YTJs0h75hh+yz6Y/Aj3puJCJyThCDIcvWTMptzxS
         2eVCLl5TzkTZg==
Date:   Thu, 24 Jun 2021 15:41:30 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] HID: input: Add support for Programmable Buttons
In-Reply-To: <20210615214103.1031479-1-linux@weissschuh.net>
Message-ID: <nycvar.YFH.7.76.2106241541190.18969@cbobk.fhfr.pm>
References: <20210615214103.1031479-1-linux@weissschuh.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 15 Jun 2021, Thomas Weißschuh wrote:

> Map them to KEY_MACRO# event codes.
> 
> These buttons are defined by HID as follows:
> "The user defines the function of these buttons to control software applications or GUI objects."
> 
> This matches the semantics of the KEY_MACRO# input event codes that Linux supports.
> 
> Also add support for HID "Named Array" collections.
> Also add hid-debug support for KEY_MACRO#.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> 
> ---
> 
> v1: https://lore.kernel.org/linux-input/20210519160349.609690-1-linux@weissschuh.net/
> 
> v1 -> v2: Only handle the 30 keys known
> 
> v2: https://lore.kernel.org/linux-input/20210519174345.614467-1-linux@weissschuh.net/
> 
> v2 -> v3:
>  * Use hex constants for consistency
>  * Validate that the button is part of a "Programmable Buttons" Named Array.
>    Otherwise the condition would also apply to "Function Buttons".
>  * Ignore non-"Programmable Buttons" buttons.
> 
> v3: https://lore.kernel.org/linux-input/20210520084805.685486-1-linux@weissschuh.net/
> 
> v3 -> v4:
>  * Mention new support for HID "Named Array" collections in commit message.
>  * Mention new support KEY_MACRO# in hid-debug.

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

