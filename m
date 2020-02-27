Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C0E1725A6
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 18:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbgB0Rv7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 12:51:59 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:12561 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729382AbgB0Rv6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 12:51:58 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 052C1240003;
        Thu, 27 Feb 2020 17:51:54 +0000 (UTC)
Message-ID: <e7857a3196443ac2a2a997bc9e4799d15168c527.camel@hadess.net>
Subject: Re: [PATCH v2 0/3] Add support for Goodix GT917S touch controller
From:   Bastien Nocera <hadess@hadess.net>
To:     Icenowy Zheng <icenowy@aosc.io>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 27 Feb 2020 18:51:54 +0100
In-Reply-To: <20200227160802.7043-1-icenowy@aosc.io>
References: <20200227160802.7043-1-icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-28 at 00:07 +0800, Icenowy Zheng wrote:
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

I'd put the dt-bindings patch after this change, but I don't think it
matters much in this case.

>   Input: goodix - Add support for Goodix GT917S

I didn't receive that last patch, whether on my address or the linux-
input@ list.

Cheers

