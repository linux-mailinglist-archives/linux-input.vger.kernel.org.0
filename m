Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533A24F9145
	for <lists+linux-input@lfdr.de>; Fri,  8 Apr 2022 11:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbiDHJDR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 05:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiDHJDP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 05:03:15 -0400
X-Greylist: delayed 469 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 08 Apr 2022 02:01:11 PDT
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ee9:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE3B5714B
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 02:01:09 -0700 (PDT)
Received: from h20.hostsharing.net (h20.hostsharing.net [83.223.95.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by mailout2.hostsharing.net (Postfix) with ESMTPS id 0B8B61038DCFE
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 10:53:16 +0200 (CEST)
Received: from nerdlicht.fritz.box (p200300ddff1d9c00f93422961ce19003.dip0.t-ipconnect.de [IPv6:2003:dd:ff1d:9c00:f934:2296:1ce1:9003])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h20.hostsharing.net (Postfix) with ESMTPSA id EDDA713BA80
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 10:53:15 +0200 (CEST)
Message-ID: <5bda19a193027baf2b6df8fe51d0c23ba33a0ed9.camel@platen-software.de>
Subject: Implement unicode input method in uinput
From:   Tobias Platen <linuxinput@platen-software.de>
To:     linux-input@vger.kernel.org
Date:   Fri, 08 Apr 2022 10:53:15 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello, 
I am new to linux-input and want to contribute to kernel development,
and want to propose an extension for uinput.

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

