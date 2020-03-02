Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD87175EA7
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 16:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgCBPoo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 10:44:44 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:32707 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgCBPoo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 10:44:44 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AA12D240010;
        Mon,  2 Mar 2020 15:44:41 +0000 (UTC)
Message-ID: <156a1f5fb89ccb8108d54376b45de6af93525368.camel@hadess.net>
Subject: Re: [PATCH resend 04/10] Input: goodix - Add support for getting
 IRQ + reset GPIOs on Cherry Trail devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 16:44:41 +0100
In-Reply-To: <1b90d2d4-5cf4-3017-9e06-6a9187a73ca5@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-4-hdegoede@redhat.com>
         <d387bb62dee39cb16bb27371c1e5764cb856c6b5.camel@hadess.net>
         <1b90d2d4-5cf4-3017-9e06-6a9187a73ca5@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.92 (3.35.92-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-03-02 at 16:40 +0100, Hans de Goede wrote:
> > Does this mean we retry at most once?
> 
> 
> Yes, we are not really "retrying", we are doing a 2 step
> 
> probe:
> 
> 
> 
> 1) First try to get the GPIOs without having done our heuristics and
> 
> without having called devm_acpi_dev_add_driver_gpios(). This is for
> 
> ACPI platforms extra GPIO info (including names) using the special
> 
> ACPI "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID method.
> 
> 
> 
> 2) If this fails then we add our own name to index mappings and
> 
> get the GPIOs using those.

Is there a better way to communicate that? Using a separate function
for that piece of code, and maybe some comments to clarify what it's
doing.

Thanks for the other explanations.

