Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFED0613928
	for <lists+linux-input@lfdr.de>; Mon, 31 Oct 2022 15:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbiJaOnC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 31 Oct 2022 10:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbiJaOnB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Oct 2022 10:43:01 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E829D64
        for <linux-input@vger.kernel.org>; Mon, 31 Oct 2022 07:43:00 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id C837720005;
        Mon, 31 Oct 2022 14:42:57 +0000 (UTC)
Message-ID: <0ad614f5c69bae7bf7081b32660d41bf4edd906c.camel@hadess.net>
Subject: Re: [PATCH 1/4] Input: goodix - Try resetting the controller when
 no config is set
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Date:   Mon, 31 Oct 2022 15:42:57 +0100
In-Reply-To: <20221025122930.421377-2-hdegoede@redhat.com>
References: <20221025122930.421377-1-hdegoede@redhat.com>
         <20221025122930.421377-2-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.0 (3.46.0-2.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2022-10-25 at 14:29 +0200, Hans de Goede wrote:
> On ACPI systems (irq_pin_access_method == IRQ_PIN_ACCESS_ACPI_*) the
> driver
> does not reset the controller at probe time, because sometimes the
> system
> firmware loads a config and resetting might loose this config.

"lose".

You can add
Reviewed-by: Bastien Nocera <hadess@hadess.net>
to all 4 patches in this patchset that don't already have it.

Cheers
