Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7F1742BF7
	for <lists+linux-input@lfdr.de>; Thu, 29 Jun 2023 20:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbjF2ShA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 29 Jun 2023 14:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbjF2Sg6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Jun 2023 14:36:58 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D91C194
        for <linux-input@vger.kernel.org>; Thu, 29 Jun 2023 11:36:57 -0700 (PDT)
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83C1E1C0003;
        Thu, 29 Jun 2023 18:36:54 +0000 (UTC)
Message-ID: <74c8ac858331c8c5a974cfff5dc981ee88aa996e.camel@hadess.net>
Subject: Re: [RESEND PATCH 2/2] HID: logitech-hidpp: Add support for the Pro
 X Superlight
From:   Bastien Nocera <hadess@hadess.net>
To:     Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
        jikos@kernel.org
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        lains@riseup.net
Date:   Thu, 29 Jun 2023 20:36:54 +0200
In-Reply-To: <5bdf5680-3b02-1408-330d-ddf0c573896c@protonmail.com>
References: <20230625162131.17921-1-mavchatz@protonmail.com>
         <20230625162131.17921-2-mavchatz@protonmail.com>
         <51ab0acb9e903798dc10ef4fe11eb726df76517b.camel@hadess.net>
         <5bdf5680-3b02-1408-330d-ddf0c573896c@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2023-06-29 at 16:03 +0000, Mavroudis Chatzilazaridis wrote:
> On 2023-06-28 13:50, Bastien Nocera wrote:
> > On Sun, 2023-06-25 at 16:21 +0000, Mavroudis Chatzilazaridis wrote:
> > > This patch adds support for the Pro X Superlight. Tested over
> > > USB.
> > 
> > Could you please list which functionality this gains the device?
> > Battery reporting? Hi-res scrolling? Something else?
> 
> Sure thing. The device gains battery reporting in both wired and
> wireless mode. Also, without this it's not being recognized by
> something
> like Piper in wireless mode, and thus can't be configured.

Great. Could you add that information in the commit message for a v2?

