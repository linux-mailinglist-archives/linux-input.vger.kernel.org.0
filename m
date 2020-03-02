Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75C6A1758CA
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 11:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCBK6X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 05:58:23 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:56097 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgCBK6X (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 05:58:23 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 09ED5240008;
        Mon,  2 Mar 2020 10:58:18 +0000 (UTC)
Message-ID: <995e0bab1c3c2013230c640f2e3a111bdafe3002.camel@hadess.net>
Subject: Re: [PATCH v3 0/3] Add support for Goodix GT917S touch controller
From:   Bastien Nocera <hadess@hadess.net>
To:     Icenowy Zheng <icenowy@aosc.io>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 02 Mar 2020 11:58:17 +0100
In-Reply-To: <c352b9e4e60a214c0f7f6b87aaf90d7fd49d5ee6.camel@hadess.net>
References: <20200228010146.12215-1-icenowy@aosc.io>
         <c352b9e4e60a214c0f7f6b87aaf90d7fd49d5ee6.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-28 at 10:46 +0100, Bastien Nocera wrote:
> On Fri, 2020-02-28 at 09:01 +0800, Icenowy Zheng wrote:
> > This patchset introduces support for Goodix GT917S touch
> > controller.
> > 
> > The major difference with other touch controllers from Goodix is
> > that
> > the ID string is no longer number-only (it contains a 'S'), so an
> > additional patch is introduced for migrating the ID to a string.
> > 
> > Icenowy Zheng (3):
> >   dt-bindings: input: touchscreen: add compatible string for Goodix
> >     GT917S
> >   Input: goodix - use string-based chip ID
> >   Input: goodix - Add support for Goodix GT917S
> 
> For the whole patchset:
> Reviewed-by: Bastien Nocera <hadess@hadess.net>

Dmitry, would be nice to land this soon, there are a couple of patches
still in the queue to be reviewed with support for new models, and they
will conflict with this one.

Cheers

