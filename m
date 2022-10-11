Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6F65FB03F
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 12:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJKKQD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 11 Oct 2022 06:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiJKKPw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 06:15:52 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00D7895E3
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 03:15:46 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 9F30324000E;
        Tue, 11 Oct 2022 10:15:43 +0000 (UTC)
Message-ID: <c582cc7d81bbfb2bcf9b397da36324fb84624fa1.camel@hadess.net>
Subject: Re: [PATCH v2 3/3] HID: playstation: support updated DualSense
 rumble mode.
From:   Bastien Nocera <hadess@hadess.net>
To:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Date:   Tue, 11 Oct 2022 12:15:43 +0200
In-Reply-To: <20221010212313.78275-4-roderick.colenbrander@sony.com>
References: <20221010212313.78275-1-roderick.colenbrander@sony.com>
         <20221010212313.78275-4-roderick.colenbrander@sony.com>
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

On Mon, 2022-10-10 at 14:23 -0700, Roderick Colenbrander wrote:
> Newer DualSense firmware supports a revised classic rumble mode,
> which feels more similar to rumble as supported on previous
> PlayStation
> controllers. It has been made the default on PlayStation and non-
> PlayStation
> devices now (e.g. iOS and Windows). Default to this new mode when
> supported.

Are there any ways to update the firmware without a PS5? Using LVFS to
distribute the firmware, on Linux platforms at least, would be great
for end-users.
