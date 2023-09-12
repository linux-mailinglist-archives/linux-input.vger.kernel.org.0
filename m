Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3439E79C939
	for <lists+linux-input@lfdr.de>; Tue, 12 Sep 2023 10:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbjILIFt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Sep 2023 04:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjILIFe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Sep 2023 04:05:34 -0400
Received: from mail.venturelinkbiz.com (mail.venturelinkbiz.com [51.195.119.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C17A30C3
        for <linux-input@vger.kernel.org>; Tue, 12 Sep 2023 01:01:26 -0700 (PDT)
Received: by mail.venturelinkbiz.com (Postfix, from userid 1002)
        id AA4BE45ECA; Tue, 12 Sep 2023 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelinkbiz.com;
        s=mail; t=1694505683;
        bh=JBV4b8UUo1MSngn/QBoedt1Dv52bT8rWeq4R22MtJMs=;
        h=Date:From:To:Subject:From;
        b=yAkY8ViIDrUGOyF7O/b352ayHh4UK+Wpikm6l+jvE3g6cYr6d2Mf/GgJ8+4PwOb1C
         S8SqPcLvxcMIwmaXTglLBCmFOziYg/Bqa/L+xBtCVuTlJesO+YJcU/cvIytoo+nK/l
         Hlcutg7iUJ29+2/kiYh4Mg2c9RaasbPc2+EaFrGcW8YE4ACk1so6/qfMZXAbz4XNRj
         jZ9LHpaPS/DUhtaEZ9OUhATbWznf96VHnlAk+OVe1ogymPCziSKuWpj8P0U4Eyn2jv
         zt1EUPNMdY27dX8oVdFZe3LSJgSj6M4exAZybH/7nofocCLlTNJ4MoRerTPHUtUFFa
         yXZ6UVNsL0cFQ==
Received: by mail.venturelinkbiz.com for <linux-input@vger.kernel.org>; Tue, 12 Sep 2023 08:01:07 GMT
Message-ID: <20230912064500-0.1.2c.6cq6.0.kjn3gqkqr8@venturelinkbiz.com>
Date:   Tue, 12 Sep 2023 08:01:07 GMT
From:   "Michal Rmoutil" <michal.rmoutil@venturelinkbiz.com>
To:     <linux-input@vger.kernel.org>
Subject: =?UTF-8?Q?Efektivn=C3=AD_sledov=C3=A1n=C3=AD_a_optimalizace_v=C3=BDroby_pro_va=C5=A1i_spole=C4=8Dnost?=
X-Mailer: mail.venturelinkbiz.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dobr=C3=A9 r=C3=A1no,

m=C3=A1te mo=C5=BEnost sledovat stav ka=C5=BEd=C3=A9ho stroje a v=C3=BDro=
bn=C3=ADho procesu z kancel=C3=A1=C5=99e, konferen=C4=8Dn=C3=AD m=C3=ADst=
nosti nebo dokonce z domova =C4=8Di na cest=C3=A1ch =E2=80=93 na va=C5=A1=
em telefonu?

Poskytujeme rychle implementovateln=C3=BD a snadno pou=C5=BEiteln=C3=BD n=
=C3=A1stroj, kter=C3=BD zachyt=C3=AD i n=C4=9Bkolikasekundov=C3=BD mikrop=
rostoj a okam=C5=BEit=C4=9B p=C5=99epo=C4=8D=C3=ADt=C3=A1 vyu=C5=BEit=C3=AD=
 stroje v kontextu dan=C3=A9 v=C3=BDrobn=C3=AD zak=C3=A1zky.

Kdykoli vid=C3=ADte stav objedn=C3=A1vky a jste informov=C3=A1ni o p=C5=99=
=C3=ADpadn=C3=A9m sn=C3=AD=C5=BEen=C3=AD efektivity. Syst=C3=A9m s=C3=A1m=
 analyzuje data a p=C5=99ipravuje cenn=C3=A9 reporty, co=C5=BE oper=C3=A1=
tor=C5=AFm umo=C5=BE=C5=88uje soust=C5=99edit se na v=C3=BDrobn=C3=AD c=C3=
=ADl.

C=C3=ADl je jednoduch=C3=BD: jeden pohled =E2=80=93 cel=C3=A1 tov=C3=A1rn=
a. =C4=8Cek=C3=A1m na odpov=C4=9B=C4=8F, jestli vid=C3=ADte mo=C5=BEnost =
vyu=C5=BEit=C3=AD takov=C3=A9ho n=C3=A1stroje ve va=C5=A1=C3=AD firm=C4=9B=
=2E


Pozdravy
Michal Rmoutil
