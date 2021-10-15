Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9986642E6D6
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 04:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbhJOCwS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 22:52:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:39764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232508AbhJOCwS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 22:52:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77B556058D;
        Fri, 15 Oct 2021 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634266212;
        bh=35DWHl+JySftzS4Y3e4mAQiDM8CSOe5+kSzV+ngTpCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PbaeDjLg32udurJCPxIVccSkg6HgB4Owy2IrABXJs7966Plv0ff1AvkAOpFN/szI0
         ZtWRofn7g498/tibqHbzBefaXYhOiZzspROwRnluU1i/+/vQ8bubJcONGn+OBkrzVo
         fS26hvwZl7Fw0mT1J6PXHs1u3VxKZNei3UERtcUp3Yzc1hQccUfLioDxS6TqXffE/2
         e7NUZLG4aArNZMdBvfmD/y+pzCCSLySrLbUCAQCcP5cpXScVLnXELiX8JEtgIx26GD
         Rf7f/IXFXtKZCLwuyOu0WDXW1I/TbT28mYETuX9QsQl9gAUiRtl8nV9Dfc/CIYXMcf
         ngIYoGuDuRHOA==
Date:   Fri, 15 Oct 2021 10:50:05 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, s.hauer@pengutronix.de,
        linux-imx@nxp.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alistair23@gmail.com
Subject: Re: [PATCH v11 3/4] ARM: imx_v6_v7_defconfig: Enable HID I2C
Message-ID: <20211015025005.GG10197@dragon>
References: <20211009114313.17967-1-alistair@alistair23.me>
 <20211009114313.17967-3-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009114313.17967-3-alistair@alistair23.me>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 09, 2021 at 09:43:12PM +1000, Alistair Francis wrote:
> Enable HID I2C in the imx defconfig as it is used for a HID compliant
> wacom device on the reMarkable2 tablet.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Applied, thanks!
