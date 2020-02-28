Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F880173475
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2020 10:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgB1JqL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Feb 2020 04:46:11 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:62967 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgB1JqL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Feb 2020 04:46:11 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 405F924000E;
        Fri, 28 Feb 2020 09:46:07 +0000 (UTC)
Message-ID: <c352b9e4e60a214c0f7f6b87aaf90d7fd49d5ee6.camel@hadess.net>
Subject: Re: [PATCH v3 0/3] Add support for Goodix GT917S touch controller
From:   Bastien Nocera <hadess@hadess.net>
To:     Icenowy Zheng <icenowy@aosc.io>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 28 Feb 2020 10:46:06 +0100
In-Reply-To: <20200228010146.12215-1-icenowy@aosc.io>
References: <20200228010146.12215-1-icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-28 at 09:01 +0800, Icenowy Zheng wrote:
> This patchset introduces support for Goodix GT917S touch controller.
> 
> The major difference with other touch controllers from Goodix is that
> the ID string is no longer number-only (it contains a 'S'), so an
> additional patch is introduced for migrating the ID to a string.
> 
> Icenowy Zheng (3):
>   dt-bindings: input: touchscreen: add compatible string for Goodix
>     GT917S
>   Input: goodix - use string-based chip ID
>   Input: goodix - Add support for Goodix GT917S

For the whole patchset:
Reviewed-by: Bastien Nocera <hadess@hadess.net>

Thanks!

>  .../bindings/input/touchscreen/goodix.yaml    |  1 +
>  drivers/input/touchscreen/goodix.c            | 71 +++++++++++----
> ----
>  2 files changed, 43 insertions(+), 29 deletions(-)
> 


