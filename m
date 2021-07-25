Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D94E3D4C6A
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 08:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhGYFxG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jul 2021 01:53:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230254AbhGYFxF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jul 2021 01:53:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EF4360F26;
        Sun, 25 Jul 2021 06:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627194815;
        bh=U/hYEE1OVprwCnEk8+RALl3+djTf3jgW7aTzSufxkcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n59b6KXd/8T2HS5q/PtyZJ3H0ID12sPEg5qD5NXRi/LwaWLuSe5CPY3daC6E26ToN
         tfvBrBH9CYb0usweebgma2T5lTS1LPkLcPVd2PON+6bCTILAtxpqZhWsaOYyKw82p3
         3XUHEM/OKqT6GhiS42609Ad07gAsucqBjM7rtBWI=
Date:   Sun, 25 Jul 2021 08:33:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid-elo: update the reference count of the usb device
 structure
Message-ID: <YP0Fuz4iNOqrYvgi@kroah.com>
References: <20210724202434.GA528986@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724202434.GA528986@pc>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 24, 2021 at 09:24:34PM +0100, Salah Triki wrote:
> Use usb_get_dev() and usb_put_dev() in order to update the reference
> count of the usb device structure.

Why?
