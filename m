Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3825FB408
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 16:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiJKOBA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 10:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiJKOA7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 10:00:59 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6819D67171
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:00:58 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-136b5dd6655so4126286fac.3
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0FdfxH0/5jERuJy0rEAw2xYwkt0QHu6+m4o6oyghk4c=;
        b=CaJzUMg5w+2rrbErS3z54Ikn57qBD059KfMlJ7rcr34/wLOIFkhWMh8pk9/2L88fl7
         8sXk7D66gyMlKJVwOEtUDJ0wJUTfcLcj1n3dX+cxryByMQFNba+W/getCoMbTfCLzzTO
         0l3a2ZZKrPohc6UclbZf8mzenHXKPmG+GPqFwbhZXUtBxJydQgFUDmZ1ZzJFgRDdsT6X
         Gp9c8HuFNAZZx1ZHlrVQ4FvME4y561ugkekRizOLvO4jWBw1EHiNCO4y7il+vj6wQySU
         KrFLWcOFsoNrkPLj45g65znKel5r+i22AdBaCOAleCssQt56DK8x0+6ECJEnc9EWxrxv
         U3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FdfxH0/5jERuJy0rEAw2xYwkt0QHu6+m4o6oyghk4c=;
        b=K0WeHPDA0nr5RUSJ2oPE9juO8cGGAZKNht/zaFVwzK1Rcs+dBULLS6JCyn8eFcnzVm
         dsc57FU+8g54F2P2hk9KxTJKa9IGB2gsNzQ2t2RkcGi0Nqkr9dK5zZbnMogvs8rC4mc7
         SEZg+Z0MfGAGn2RE9XZ+UAqhOkASeG72fU17NqMp22Z5YmEV4+/GYCuKk2M/CPIwSe+E
         T/dIyKY98SmhHxJChIg2XQrAs8OiCH3UssQ0SDN2p0yowpZYqcSU/ow43jbZwACHiO6/
         Pp7nELvu1jbLWF7lahMOmG4zbGSbC9ncL+fYyZZYETkyfwecmRrxDgtsiW/MzRhdjMqc
         7K9g==
X-Gm-Message-State: ACrzQf0bnbinIPd1gXezNwdq3uo2bNYLieErgEvzp91v/0zae8eBQ9tN
        RyZW8HpcFsd51da3D5ypIBkZRlCvySU7gzF1XUA=
X-Google-Smtp-Source: AMsMyM4rEHQb97XhvEkH8UpkyB4flzQW2Xti+JfusArc9Q99IQQWbMbTrAYfVpsgcADn6gV9qcBYlSoWyChCXaxqri8=
X-Received: by 2002:a05:6870:8910:b0:131:2f31:dc1c with SMTP id
 i16-20020a056870891000b001312f31dc1cmr19057465oao.290.1665496857705; Tue, 11
 Oct 2022 07:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221010212313.78275-1-roderick.colenbrander@sony.com>
 <20221010212313.78275-4-roderick.colenbrander@sony.com> <c582cc7d81bbfb2bcf9b397da36324fb84624fa1.camel@hadess.net>
In-Reply-To: <c582cc7d81bbfb2bcf9b397da36324fb84624fa1.camel@hadess.net>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Tue, 11 Oct 2022 07:00:46 -0700
Message-ID: <CAEc3jaAoL4cxD04dgq8xMk+dvtgi8sdYkCLxQJxOPJmJ5YjtUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] HID: playstation: support updated DualSense rumble mode.
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 11, 2022 at 3:26 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Mon, 2022-10-10 at 14:23 -0700, Roderick Colenbrander wrote:
> > Newer DualSense firmware supports a revised classic rumble mode,
> > which feels more similar to rumble as supported on previous
> > PlayStation
> > controllers. It has been made the default on PlayStation and non-
> > PlayStation
> > devices now (e.g. iOS and Windows). Default to this new mode when
> > supported.
>
> Are there any ways to update the firmware without a PS5? Using LVFS to
> distribute the firmware, on Linux platforms at least, would be great
> for end-users.

Update mechanisms exist and it is supported on Windows. I don't have
access to the details and it is very complex from what I saw in the
past (all over a custom HID protocol). There are so many permutations
of devices (and subfirmwares), which makes this difficult. Besides, I
think there are other reasons preventing us from this disclosing this
part unfortunately.

If someone wanted to update their device, it might potentially work on
Wine as it can use hidraw, but at your own risk...
