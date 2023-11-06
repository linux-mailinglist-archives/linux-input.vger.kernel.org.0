Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041317E1933
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 04:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjKFD2n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Nov 2023 22:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjKFD2n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Nov 2023 22:28:43 -0500
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990A6FB
        for <linux-input@vger.kernel.org>; Sun,  5 Nov 2023 19:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1699241318; x=1699500518;
        bh=kdEtC/vnjbTWkwy6LdABWJguWjTmbGR+LqobrWEGpLA=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=LyUzXsvNc57vDlVzWTPR0ScrUMYdHQg12m/Wg9Anu+S6P5QWtD2SL2ymbF2BTBtFw
         SFtaoRczbf+QShbx1mywYk4RRnAVPntcrbpYfkMOg9JeZpePnI+bg1ahkX1FebhL4s
         FE+nM14jN6HzKeFjs3MLBPoOeqzDY5fPAILTOWqRT8367ca/lXyo6xZbsozDB+qfmx
         GqF9f/1hIIacSgQCH5O9fXseNNJe6foF6eRNrfAfN/RIGevZHjL2gC+EWoObHXlKHG
         Zt8rH22lGJpluNvS26NMkdECfPbgUfCjMSofTDVTQ+Y/1Yb8ieXwtVN4bqjiltSUYt
         ijSumKNwP2KaQ==
Date:   Mon, 06 Nov 2023 03:28:31 +0000
To:     Brett Raye <braye@fastmail.com>
From:   Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: glorious: fix Glorious Model I HID report
Message-ID: <875y2f1rxg.fsf@protonmail.com>
In-Reply-To: <20231103011038.27462-1-braye@fastmail.com>
References: <20231103011038.27462-1-braye@fastmail.com>
Feedback-ID: 26003777:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 02 Nov, 2023 18:10:38 -0700 "Brett Raye" <braye@fastmail.com> wrote=
:
> The Glorious Model I mouse has a buggy HID report descriptor for its
> keyboard endpoint (used for programmable buttons). For report ID 2, there
> is a mismatch between Logical Minimum and Usage Minimum in the array that
> reports keycodes.
>
> The offending portion of the descriptor: (from hid-decode)
>
> 0x95, 0x05,                    //  Report Count (5)                   30
> 0x75, 0x08,                    //  Report Size (8)                    32
> 0x15, 0x00,                    //  Logical Minimum (0)                34
> 0x25, 0x65,                    //  Logical Maximum (101)              36
> 0x05, 0x07,                    //  Usage Page (Keyboard)              38
> 0x19, 0x01,                    //  Usage Minimum (1)                  40
> 0x29, 0x65,                    //  Usage Maximum (101)                42
> 0x81, 0x00,                    //  Input (Data,Arr,Abs)               44
>
> This bug shifts all programmed keycodes up by 1. Importantly, this causes
> "empty" array indexes of 0x00 to be interpreted as 0x01, ErrorRollOver.
> The presence of ErrorRollOver causes the system to ignore all keypresses
> from the endpoint and breaks the ability to use the programmable buttons.
>
> Setting byte 41 to 0x00 fixes this, and causes keycodes to be interpreted
> correctly.
>
> Also, USB_VENDOR_ID_GLORIOUS is changed to USB_VENDOR_ID_SINOWEALTH,
> and a new ID for Laview Technology is added. Glorious seems to be
> white-labeling controller boards or mice from these vendors. There isn't =
a
> single canonical vendor ID for Glorious products.

I agree with what this patch is doing overall. However, I think this
patch should be split into two patches that are part of a patch series.
One patch that does s/USB_VENDOR_ID_GLORIOUS/USB_VENDOR_ID_SINOWEALTH.
The follow-up patch in the series will contain the work on the Model I
keyboard.

>
> Signed-off-by: Brett Raye <braye@fastmail.com>
> ---

--
Thanks,

Rahul Rameshbabu

