Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C5319A8D8
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 11:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732144AbgDAJtA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 05:49:00 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54533 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731396AbgDAJtA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 05:49:00 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F12D6FF811;
        Wed,  1 Apr 2020 09:48:57 +0000 (UTC)
Message-ID: <cef52c56239ee32136d3fa56dcb5ecab6ca0e2a2.camel@hadess.net>
Subject: Re: [PATCH v2] Input: goodix - Fix compilation when ACPI support is
 disabled
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
Date:   Wed, 01 Apr 2020 11:48:56 +0200
In-Reply-To: <939fa592-599c-35cf-908e-d0b29639c992@redhat.com>
References: <20200325150246.128463-1-hdegoede@redhat.com>
         <20200401014529.GL75430@dtor-ws>
         <939fa592-599c-35cf-908e-d0b29639c992@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 (3.36.0-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-04-01 at 11:14 +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/1/20 3:45 AM, Dmitry Torokhov wrote:
> > Hi Hans,
> > 
> > On Wed, Mar 25, 2020 at 04:02:46PM +0100, Hans de Goede wrote:
> > > acpi_evaluate_object() and acpi_execute_simple_method() are not
> > > part of
> > > the group of ACPI related functions which get stubbed by
> > > include/linux/acpi.h when ACPI support is disabled, so the
> > > IRQ_PIN_ACCESS_ACPI_METHOD handling code must be disabled through
> > > an #ifdef when ACPI support is not enabled.
> > > 
> > > For consistency also #ifdef out the IRQ_PIN_ACCESS_ACPI_GPIO code
> > > and use the same #if condition as which is used to replace
> > > goodix_add_acpi_gpio_mappings with a stub.
> > 
> > I am not big fun of multiple #ifdefs sprinkled through the code,
> > can we
> > do more straightforward stubs, like below?
> 
> The solution you suggested is fine with me.

The patch itself is slightly confusing (it looks like it's renaming
functions), but looks pretty much like I requested, so:

Reviewed-by: Bastien Nocera <hadess@hadess.net>

