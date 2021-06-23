Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229083B166B
	for <lists+linux-input@lfdr.de>; Wed, 23 Jun 2021 11:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhFWJGf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 05:06:35 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:46567 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbhFWJGf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 05:06:35 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F344E6000C;
        Wed, 23 Jun 2021 09:04:15 +0000 (UTC)
Message-ID: <cb02492316735924141e33d359398d3c284e9e74.camel@hadess.net>
Subject: Re: Goodix Touchscreen / Patch for Inverted X Axis on Trekstor
 Surftab W1
From:   Bastien Nocera <hadess@hadess.net>
To:     Julian Schulte <schu.ju@gmx.net>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 23 Jun 2021 11:04:15 +0200
In-Reply-To: <CAABSQwGOCfBJTgaSSm1SWZM2BiKnQYtesfiqAMOc051tNRDjsw@mail.gmail.com>
References: <CAABSQwGOCfBJTgaSSm1SWZM2BiKnQYtesfiqAMOc051tNRDjsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Julian,

On Wed, 2021-06-23 at 09:08 +0200, Julian Schulte wrote:
> Good day, 
> 
> I have a Trekstor Surftab Duo W1 running on Ubuntu. 
> I noticed the Touchscreen has the X axis inverted, 
> so I made a Kernel patch for the Goodix Touchscreen module to invert
> the X Axis on that model. 
> 
> In the attachment you will find the patch file. 
> I have tested the patched kernel module and it works well with the
> patch, the X Axis of the Touchscreen is not anymore inverted.

The patch looks fine, but you need to follow the correct process for
submitting patches for it to be taken into consideration. See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst

Cheers

