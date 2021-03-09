Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81D83321A6
	for <lists+linux-input@lfdr.de>; Tue,  9 Mar 2021 10:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCIJLV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Mar 2021 04:11:21 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:22358 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhCIJKx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Mar 2021 04:10:53 -0500
Date:   Tue, 09 Mar 2021 09:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1615281052;
        bh=5++USATAldSREJkbCto+ZCMysHLT5kyoo7bb0I/zWrc=;
        h=Date:To:From:Reply-To:Subject:From;
        b=knULc6G4lxzKCMZ+WI4yvwsjKsZ/V3dHRmLCb+rHQdl0QcJeACzWgJKVGmJMjpytL
         uuBq2Yt9Z1WuQfFq0v201puUK+OGewfcIj3tpMIvDkkRc4w33ZWVoBWfzwp9QwcRIm
         HX6Ie0cK7bw94djGVLYIaMp9GpUXDKqdywd299OM=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   flostriker <flostriker@protonmail.com>
Reply-To: flostriker <flostriker@protonmail.com>
Subject: Possible kernel bug
Message-ID: <TT2o7vp17Ly8xGZm2HkbE7nGMS4oxh2FnyweA48pnfYsHokDKWvJP8z1GKK3rnOYaT5xhB9QXsSWvv29YtFo-3QAglt0nH4yn4w3sfubVhY=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

L.S.

After upgrading to kernel 5.10 on my Lenovo x1 extreme gen 2, I started hav=
ing touchpad issues. At the time I submitted a bug report that I have linke=
d below. I saw the following patch when looking at github:=C2=A0Input: syna=
ptics - enable InterTouch for ThinkPad P1/X1E gen 2. I then emailed Jason D=
onenfeld to ask his advice on where I should go with my bug.
He recommended that I send an email to this mailing list. He also advised m=
e to attach my dmesg output, so I have also added that to my bug report.

Thank you for reading my email and looking into this.
Yours sincerely,
Flo Striker

Bug report:=C2=A0https://bugzilla.kernel.org/show_bug.cgi?id=3D211661
