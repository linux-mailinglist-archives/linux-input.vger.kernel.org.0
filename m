Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0495857D3
	for <lists+linux-input@lfdr.de>; Sat, 30 Jul 2022 03:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiG3Bpl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Jul 2022 21:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbiG3Bpj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Jul 2022 21:45:39 -0400
Received: from sonic318-21.consmr.mail.ne1.yahoo.com (sonic318-21.consmr.mail.ne1.yahoo.com [66.163.186.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE2B4D83E
        for <linux-input@vger.kernel.org>; Fri, 29 Jul 2022 18:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.br; s=s2048; t=1659145537; bh=Uhtus2ZEjDq47PV67v8HWtlCPMuTYw0XT2741IsLsw4=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=oO8/qTKTXafC7a7QYoVA5YHSVkly7sDX5Gyf3xsKNnIsV614iu5Sg7NKdYWSuI7EgIbz02HuEbeOxqwrLXS9mf1Ubkw2OK4kLfNFccMAvcbffugbfLpghHrSAmK3Cn03zXYShseKiKhLEHpON+7f5NzTr9BUwp8K7amDm4ztmMbI+K6/1LwcHLC7fqMK8KLu8FKNwcqXzPiCNcEHG5wTeZsLuo6GT2lJax8oRO4/e4s36iLWbvAs+bgvvwX/MFX6Uk1ABxCEdtAhEGoZzr5rO5xspH/SQz0MtQCIMhoPuk0+2KvXsN46msx8r2KkHXrGMyfVBExzaUWzD0+idYm6dw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1659145537; bh=wvv2OkjFcsG2ksAn83ZQMk72gCEejprA1Mvs8rdU0l5=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=FOPSzCKREIpsyuAxGpVwyjpUv7CMKUCTjnV6UOXyVueV1WbPirt++YgO7Wi2JyKqtvUK5QbShVt3n0N6c4S/enJKTzWHJFQPLsEmTIYFsIkEcGRlZF2lDWjA9cXE+ly4IDGD0XKRKUEbAx75vfJacOqMrXUuzM26FCS6QHMdwtWJ0ZX8H9Ju8b4ETvd1+4BPgYdgAuYu8BolKadKcRHo7NsJdhQrGaoDBuHiXBS2+VhiOIXobmmhK4araDa/sfTVp7pkUnCmhDb3ay9m9MFSoVMvn1Sv+GI9vNHsbzznLzSc3Abmt4GIKoYakT9IEEh3O6ZzTJNrV5Kt1necfgZEpA==
X-YMail-OSG: dk9RB6kVM1kTqVus.pwh.Z5ISMNPQqHSUgbH48oeOH4imPQE5DfYh3eCKYQwrDS
 PQzqsPhWaWrPA6kvGNCAcHNgyZN48bQEn5AoOk.t4acUZ1oSGFVUyKBFxrzzkdL0sVIHOUUUmFkv
 FlIVV5ggjP_6ne7Ca435pzeYO0JAega.Qo8jtq..0QDtqYUWwFcrNDyJyogy_ZTDGtvEz4xiUA3_
 ZFI9I9WY4x4y0dzm1iLPo1BoK8cPX_p_LW.Ca4iad.JfeJGouv7pU9ctQmAGS6QAVpp2qh2O5Pxz
 7bkGW3HPy50haFDsnbqLAXlItskN5lnN_3_oSMeZ7MrQy.0.hRO_7xgnwOZyILi6vNY0ihRrJr16
 7j_Kqu3RfYa3I5.xIVhB0NT1sp.H6IgPwE.vIY6a_Hbh6THWbWJfy1ZjWi3ESEr76zD5YjBfRzqs
 ukHHjtYyjD6NCcXFsQPb3R.3ZHdNhXUB4lA4r6oqO_dGGWv8XHbXjFSBy4e.__P.9ieUHbo.IXsq
 _fO7fvB4TSCkrUq5BEqtzkpeyy.CLS__HHJoQyWqaKA3d8WLQAybCw2oQ2qJJFhW2.5_TX6evct6
 caiuuYOUaGHyL80mdj1pFufauzuN0Ua6lANDB8VL_Y3auxUoGWN2GnxMDUMrE9avqt8cLcq71i84
 T8p359Yp9gcdRWmJUrSzgec5g677_mc972O2iYSISg3E3dl_ZpTktQ4qnyi3.V58zGQerckZcR98
 b3YUN9Mq2C.ybUHrSCFxNJuiarkKmc5K3cLuQeO0G1hdhFuYrPF1MDq1THWPOVv9CIEPOfsKCbxL
 lvH.g2tt0MY7FCkEHOaWnWOO8VfrsDdHUYIcToIyCCEX1kNa4G7f6EFmqVjvKmIN7yF2eIzNRzRX
 QRGhXTQKeIGtdLYBZkjJA04uiIU1wBz.lFYMPklQPMFY1APyvz7_Rp5ptgTaxWThR.Zbw.7pxLBL
 ju.onDRDdULD2_peNEZiug7wYkLgbEg67kujPaL1w6qhwNbkiMxVQ83xA61c9bP6Vm1uIpF1zK.Q
 M_xxWinQ.OrbL8urYBHm6n6EXDQPqnV9Q2A2kGz5r0aINaEWi4ZE.X0bp7HKvfe2B7im5Dq3PpAN
 6__BFZFdbfHNJYRfItYF60CPb9XBRC3WJkW0LKA0uFYhF5weHHs5k5qVtIhH05TZYUb.ENl84NzI
 7hEll5Oj6F19WbTv1ScoE.F79gbQ0KwAHGcnrnNG9bsJRRLnpiyjWzhaOx7BfncmiYnqtJOI51Hg
 ehgQtJHFxAwPszIEepsIeJKnn9stehuS0xtL7hGBvl.53tvURsrQcsbF1POEZjHv0Mb5NDiNyJk0
 KoR0W.7Nn22lJxVy9tmLO6l0eqBtFnXu4CPIgK1qr6IRMskeYJ0DjYf1O4HjphNiJNN7eqH8w5H9
 _esmeLTrd1VhM9F7fw7skqBuZu_Q2Y4KH7qkiXP7p4LXfNgNIZ8NK6fc_eMRsigLj4mNVfzW12tD
 w5P.EVShGlrQ1g2TRqXYWq_yKkcsxUsD.uG29Q4SZ_Z6IpFqPM77Pa9gJd9uD5ikRWdBmwFIJS4Y
 l4WSr3Uzo1wy0ol03ZnIAI3WVN59HIHLoiSjhX7LRLOadYHiIYUCdLthQx8t2pt6apyo3O8vgWCQ
 um3NzY2qPLcSmwXGZ6LaillaG.oSIlAkdrZWat5VLvIPQwSkySYi4QoXZmzMDzCyA97rESzLTr3Y
 GKNq_HLzPy.vReqlfbRA1T6HqqyAMiTUxma_1ZAC56rlEEZBfZAeSOYFwvOc59MJJE1we0OAcdIE
 B1onOo9qnP17j0Qf6vqpK3JsN81MzadhfHvmva1sgk2mzKzMJn2HHj4Xk3Tw1pFeFCbbzGNQNBhb
 RtwshhBjkK7zubbxasPi3IxOr.eRuVmd3aiDAlDuAhZS2S8AOTs._tW0iIw.4.CQQ8MkFuqrMb6O
 1m662JKNrZpC_yYv3odu8KXoaAvVHW1O.WAsahzWTIiDKRw5r4VSaE6aEhKIkp7hqRWQpwjsLnZR
 yO7zLH1CA8cDmksW6NIkCwh96O7p8qxJFALOx9Za88x0j002PyXiyrbFAEq59ypaqI2DNCu875zs
 JGjvEeRE4zsPMDdiI9bBRDsk1IfoqM.x5PGgNtWQMe5ZaAGZ2ucvvDWk5QNLNRnoePWKksaFtJCE
 zF0FfrrW5akg_OtLfqkIHrsNA8dCoWrqBFS1DA1Q8fq6Cm1YIROtTlR9beIdlbTnd5dJyj7I._z2
 h261XMoi712oiAvL_
X-Sonic-MF: <jackmcslay@yahoo.com.br>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic318.consmr.mail.ne1.yahoo.com with HTTP; Sat, 30 Jul 2022 01:45:37 +0000
Date:   Sat, 30 Jul 2022 01:45:35 +0000 (UTC)
From:   Jack McSlay <jackmcslay@yahoo.com.br>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Message-ID: <62890335.4126474.1659145535086@mail.yahoo.com>
Subject: FlashFire Cobra V5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <62890335.4126474.1659145535086.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20447 YMailNorrin
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I bought a FlashFire Cobra V5 - a clone of the VKB Gladiator MK.I and it se=
ems the hat is glitchy. Instead of reporting each direction as it should it=
 appears as a single axis in which up is 0, down is 120, left is 180 and ri=
ght is 60 and the value stays on whatever direction I press. It works norma=
lly on windows so I don't think I got a defective unit.

I'm on Ubuntu 22.04 kernel=C2=A05.15.0. I have not worked on the linux joys=
tick driver before, any idea what I should look for to try to fix this?
