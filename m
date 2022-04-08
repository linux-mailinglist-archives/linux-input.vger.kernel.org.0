Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82564F8F27
	for <lists+linux-input@lfdr.de>; Fri,  8 Apr 2022 09:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbiDHGnD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 02:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234304AbiDHGnA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 02:43:00 -0400
X-Greylist: delayed 477 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 23:40:56 PDT
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A696DD7440
        for <linux-input@vger.kernel.org>; Thu,  7 Apr 2022 23:40:55 -0700 (PDT)
Received: from h20.hostsharing.net (h20.hostsharing.net [83.223.95.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by mailout1.hostsharing.net (Postfix) with ESMTPS id 16BEC1004291D
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 08:32:54 +0200 (CEST)
Received: from nerdlicht.fritz.box (p200300ddff1d9c00f93422961ce19003.dip0.t-ipconnect.de [IPv6:2003:dd:ff1d:9c00:f934:2296:1ce1:9003])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by h20.hostsharing.net (Postfix) with ESMTPSA id F24D4137B63
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 08:32:53 +0200 (CEST)
Message-ID: <70f0cb250b710c561a6f0d97964b91c7dd436412.camel@platen-software.de>
Subject: Implement unicode input method in uinput
From:   Tobias Platen <linuxinput@platen-software.de>
To:     linux-input@vger.kernel.org
Date:   Fri, 08 Apr 2022 08:32:53 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello, I am new to the linux input mailing list

I have been using uinput with x11vnc on a computer that has a German
keyboard layout. When I press certain keys that are not on an English
keyboard nothing happens, as there is no mapping from the unicode input
(öäüß²³..) to the US keyboard layout. I have been asking myself, is
there a way to enter unicode characters, directly in uinput. Maybe
something like EV_KEY_UNICODE and using ev.code (a 32 bit value) to
pass the unicode value to the application without having to de-
translate to qwerty layout again. Another problem that happens when
detranslating from qwertz to qwerty are shifted keycodes being
different. So When I enter a '#' a '3' appers on the screen.

memset(&ev, 0, sizeof(ev));
gettimeofday(&ev.time, NULL);
ev.type = EV_KEY_UNICODE;
ev.code = unicode_codepos;
ev.value = 1;
write(d, &ev, sizeof(ev));

Tobias Platen

