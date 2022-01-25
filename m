Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F7E49BDF7
	for <lists+linux-input@lfdr.de>; Tue, 25 Jan 2022 22:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbiAYVql (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jan 2022 16:46:41 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:48307 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbiAYVqg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jan 2022 16:46:36 -0500
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 62C9E240004;
        Tue, 25 Jan 2022 21:46:32 +0000 (UTC)
Message-ID: <2e13fc7616e09f670a244bf246d85804659d45ec.camel@hadess.net>
Subject: Re: Stylus battery reported as having 1% charge even though fully
 charged
From:   Bastien Nocera <hadess@hadess.net>
To:     Sebastian Arnhold <sebastian.arnhold387@gmail.com>,
        linux-input@vger.kernel.org
Date:   Tue, 25 Jan 2022 22:46:31 +0100
In-Reply-To: <cb3d941d-88c7-1ca0-27db-92d32883f355@gmail.com>
References: <cb3d941d-88c7-1ca0-27db-92d32883f355@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2022-01-25 at 20:48 +0100, Sebastian Arnhold wrote:
> Dear developers,
> 
> when using GNOME 41.1 on Wayland, it reports my stylus battery to be 
> stuck at 1% all the time, independent of its actual charging status. 
> This is also independent from the stylus I use, as I've tried with
> two 
> different ones.
> 
> The device registers as ELAN9008:00 04F3:2DD4 in GNOME settings.
> 
> The GNOME developers helped me track the bug down to upower, as
> upower 
> itself shows the charging status to be stuck at 1%. The upower 
> developers then closed my bugreport and relayed me here, since they 
> believe it's a bug in the kernel itself.
> 
> Can you help me fix this?

FWIW, you need something like this for your device:
https://www.spinics.net/lists/linux-input/msg71471.html
