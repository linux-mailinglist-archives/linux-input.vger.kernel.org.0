Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729222A8A08
	for <lists+linux-input@lfdr.de>; Thu,  5 Nov 2020 23:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732156AbgKEWln (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Nov 2020 17:41:43 -0500
Received: from sonic307-3.consmr.mail.bf2.yahoo.com ([74.6.134.42]:40308 "EHLO
        sonic307-3.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726729AbgKEWln (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Nov 2020 17:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1604616101; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=PVIj3Xiqw4tMjfnlzCH/3md3eu/NIwkuYnzcS7nTP9dyzeoMiGTx+ykq6PSLPal6rU4WA70jNu+GGjM4vdR4zo80FJzUmIOzpzixpTaQiIo83l1iZJE3VelwUVt8VaScDzp1noIS+Cfmf2hvlQFEouoXUP9/cE/XVSVDT3oQipsI/o+8cMpV6mzF3thq3OXDxgXCI7y9re/HfmvAGzTSTuSzai8cWhR5+dkmnAlOUyv+1QPFhu7+yGg47Kq8XWbU0QR35+MiA0ll6e7KV/90m8a5KQ+kyX3o1f4xiEgw5rb3OeSsoFN7zhBNjBOcrUbd4vuMHFumrX83OF2ICwnvIA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1604616101; bh=sM0bEvoY9KUTenizu2IVQvSggpJxQjZbicIS122fpkT=; h=Date:From:Subject; b=QvJFV8j7OWoTY7sGRWrX+XZ/2MWzdhDo4NoclIEWke61ranvuWmTwGV+b16iv/aXPoU9c1hxZOwsi51RX9f4fX2FLb+773qOps8IM61yHGgNuRXdHHunpjnS00iQbh+deeF1rrY4UbQEuPgZQm6LQHgI7MbEduwQhagcfV6zf5NOhZT3PHR4opbl9ORKKPQTQHrnD04inRXvzhr1bCIIsUFUPiN4+5fNtGXb3pVJwo0VHeHHYAE5QzCGCMCbT3aw8prATBuGmAwaUBRjCdMnZ/98lpUxiuGzKSp3CPND5vAwgif6qUVofUEZyivyY8478GnobjokjrdxSg3tlM9p6Q==
X-YMail-OSG: TIeC9_gVM1l7hV.D3oB6s2SB3zH7uhBJKDFje1.LW_J5aqNLBP84ku7z1MOUEFV
 eSKMO8u._8XUzLMiOz0Zg0R0BVPAZ6.9iN5nHhivxbmyEYAGqWaxO.d9gOL8wo.BY7WFYxexZ2sZ
 NhRk4ad4VU7d3rXTKpfJ4vz9k3z.Stm90.bkin5Pq6.y3YfpasAnAtSux8jkq6oaCo.KMOWBXPSj
 ZQCD0dPcpFtsKd6zLXxzpKnQOfIGx82GR39iB8erlwZ_LIY8DEpYBKnMv981FN6GcnFvt6LRZp5H
 Jdh1NyWnArYDJuR0.uXK_rLo.mV1mHYm2puGwDN1x9ieTCoZDbYFkBd3QghYJZSkSyj9kzf5lF9A
 XBSP9pQgjW5YFx7uX8VHbdydKRp0I3EfbqS6SNh3tQrywB3i448.kL9eu5blSVJy.fVg61m_6XlX
 DH0gBxZc68izUi7t.cNx9iva_6rkJnDDfHcj2os6Aq2LRtpB3WRgSuQlSrpkP7MnTOsaE4pFG3Cu
 IDblxxjDNXBIXGEc3_r.17eQhiJ97vml2KS3Y9ZvfAIsJSX.d997jyZZGpqvdNvmC5s_BYczgW2f
 0.DLhp_jGdBt.ANdiQZ29ocukreEaOyWTz926834wKywlgIcedpPAM0rOivTqIrXZyfCYwh.Yjlh
 1PE.f1cd8wZnCRlH_GDAO8UZ9zBGsaqPhQ3ihDJj12ucNrvUCzGIjLd4yi4p31WDJZRxi_W_2DQ6
 LqckgBOYPEJLMEju1aI84Lme7_y6jM6H3CS45cjqHQNZIdfW0y7NaBKhB0S2I3.Qk49mTOxXCYWe
 rF4Is312PaGxeMpPIkPXQWJn9w4w8fT5Dfh4VSERRjq0X0Z91LSgArZrOLsS0HrnOskxDiIWhOxv
 e7YoobIeyH01kmSte9po9BW6edxm00H9_UHeSDxsMWBJI9QxGkJjNZORdfrMSsQXjwoUgwjEgAXg
 uva2RltKmsPGwY9mhjEY5WsF5riqubWr_O.0i0gBu4UI2wNyqomHO6a5qW1Rol2CxFLqIks85Z.i
 3IhZhMUScgwUGLNJrD4Ev0TF5PdAKQGsWjW_YI8AT5NRyTnyh9F9UnTaSGzFS6HAoVEUSDOnooN1
 W9Tt4slQgzUPzX1Hj.S3ZUJJldZyj16ztBeKiK_kehFc86ggxVl_SBkzzs8lQj9SyvPjdFbkERA5
 bX1qK._bzDlu4t3OT1xuP9lre1Zl4eiBLERrI6g5LRfJ2b2uVvGCPMqtfnMVodIhPncpQQfYABfZ
 63utZD_Snv3VcrcHrDzI8t_3we0VxZ3lw2kAeKS0Ti8qFkS_tGCZRi9D.k4X5hWFUSQ9aS8F75_l
 WzZCCTkHxK.W2McEIa6VRhSnpkbdOzV3JGvgnnzH1gPXCiGT1vhemSb.Wc5dbAZLxHfbSeNZtOMY
 HfpoS3amXoQzfyfshGNpQ6n.29ma0vbEso7DZW8a49lpwbvzMHDdlAFnuGFWgabB_NHdCV61pSna
 Gyh20.TcF_mnM1dGRetdL6DtjTBfJ6iMNjrzI0dLKbBalitMSsB8mqqZYzUax9Xgk.3yJjF5jMrD
 o8bHBjkfg9Q0FupQaXsjgvYljb0qREZcD1Tf6QcWAePBN.fQRZ3iFkz6IMCxT0rt79MBvqJLkzXF
 JAjMMqAsOyokx3OgLc7e5XTWPhwu8fNo4Jr8eX.5dprjm977Zs6KIzjKCbOP0dgRdkXkPy0b957W
 09dL42MK5CV4H4Oo9IJjQn7IFdgnl4JJnu24HqVw3jaDITnB3MWOcuUpX0rxDGn3cuump9fRGz42
 nR9XQPbuf028fPZNYl2r80IKQlb1Xpw.5EvsFZp9hlU2KUQzFKybqDoUqcNThFi2nRPJ0tmMG86F
 JyCOl2a5rTzhwXXc4b7oVraKWNYp8q39ro7WdFBhpypM52ak_NFH0pBI44V8Yy9aqUx7B5fypc6V
 Q.fdroO0pOXiNCAVpUDsQu.kEy1zpsnPPC2CrRqcbfQUnwidoWCZwQasynrXFzfIPppFMg5GH27F
 eUiZdtBAfpkcxjIAMDmQBm2X_uLcJDOQHk.dqrvrmPxy7_D5Ztcl4E0MbI40YyPMSmNGiGKVtQxC
 gPT6_n2AIrckPuv7iXd23a7.c9c9TFZoG6R2subbXGULDC_Z4L5k_cfq6jrWi_bfKemQ9Ucx8SLk
 HPSHlkCD8Q0EokINL7mn7OB2QnMRwbrVItqDqneT9LgVh8XA15y5QbDuhk_xBxm2lmI5gGU2Ye2z
 NSaIDFwtj6pAe3E7wypV5WLrGlvVv6G8ovWqZGsVyRwEDAgHVHpOe.zSI0Bu0wea.6fHWqwpVUKr
 51Dq.V.P3DfBq.PvfcODEB19Ig3JnwA2JaNGHXjQNqR4t5eksjNLvCnJrbbp5geWlSiiWYfOf27m
 QJUZ4w4p6VB4qBsTJlxspKOPVFhdkxQWSEy9Nub8uHdOYk3GulSr0YNOAYbiOipcG4S2ctCUZ6RG
 txCnmOvPLpePzmpDNCk1knktSB9NOJKnvbGmh6kBbFgmvTGc6pHQolzpoOAlUCtjHqev18tZBJNC
 opt6clRoTCrl1NXFAbT.yZKjKxh.JZ8QCuK6TkuspWMkpUEOvBAs3UvVKkCD1sW7Te2H1avL00tq
 CmLwUVC5cnfQrbpmDRbRX3NIQxKQrcdMgFnSNfuiJrXOcCTj_5VGGXYpuS09QqdzAxJpspQkdQBC
 96tZ2U19FLESyh3Dnyu6wV91UNYt0Vz3ieqSkA5WS_S7w4BDreKmfFFn.8v9PWhsH6m_Um60XQgL
 wOWJO7dVIUPQQLDJC9mtlTFCikR2OhVA1S5dW0HLvTRXy_llum5c0oSU7S1ohLy.luJcbs9MCzDj
 oehuECYAKF1P2QKBRr7xEXsW9YkCNBPwtCsqirkBISz1FZGLJUDTV3t2Sa2DcGbWNYhLxcxIzxA0
 zKJ3XnvUFNCjf1gDhGGdtppBRSAzCFjmgJ0r2nC3BmPeroWqDQ2h_mYE1eWC9q7mwAUCPHaBXUg1
 s1rh7tavbiBIyGbsHp.cYN1jv01jt.vI2n_RjG_2ZCB6dS3MA4rgQISipRJX4clWXU8Qxshd4N1i
 h.3TxgAQaWpI0nm7VGp5m4CdT.SWOYx1KN2ifoG5a4CCBe9wK3CP_ccqEKdU_7P2x4enwqswZaaZ
 3x2Co2MsW3gOlQI3ZSJSSoeodBjJ.LCDxWVq524mJiwE6FqILJAkCZys_v.kqvSobeMg6ufmtPWt
 HiI7Xc2ea0.9DuwIsVoAzrTDKOBMJIDyb3z2nLk0a7Az8virNfRR.wVo7PWdLIesHm8wHoCI3NTB
 1ZuvUY9r4xWlfyVQ4DsdRvSwImHbS9Q0ShsTwJgVNtCF5BSp6GK3Aqf6YB0iPdxSceE.tuHSpxXR
 dZ42y4DpZKGf_X.gSgNuL6DjA4_Iev4ZtAtr1Rl4fn6c7e5.PY4db3OUS2tE4LWILoc6EkNSMymk
 1GsOEG47FuC5vcHWw2S1SdkVMo_GiDYLTh42x.mriXdpt6gHm0n3lqNxJ4cj..wR8.moe8uWcUS9
 23KvLiRtH6KW47IJ9eOP4G2rw4yXkckIm_2v0b3mWjY.fAcsmZfWUjjA8c1U3SOhb4LEoirH_5Ql
 Ff890n.8NMwGv5WHJbHG3O__8piwwhX1EcD.lCFM3g1ow4fDRoGmbJVSq5YXP5rsN2e_0xDVE_7X
 QFLBcFf9BaaZUaY3aZ7dPjUNvde1CjscwsHHrJ58QUT4Pdg5NZhHCwMyCnyOOq7U625_noxY3h_c
 tDiVp5PY3uweXfrT78BBNf8dfKnukcH_Muc_lxvvunllEwcFh2SJ38sGDQP0keLuuldniVwzRaym
 AaV.9NLGfUvggAvKOlLp9aaakltufryvQLL9qqSoaxLri20BzeReZQ4ntINO_lngoD94BhEFAdP9
 m2l1BPPS4GiFwaGgXsQri.hSb5WEE_N5dQtVFUlq8Qn2YGvbc2ZR8hHY71r9U2ESpVvzqXz2j5EB
 kC7RYbo.EibDDoSGz7HtcuiCkgSSgWYkkxKMuivIUMYtZI_dIGXdrg9qIqLSsff1u0.9on.nFVm1
 W28M0a9fE8fOiOY9sayw_ygRHQSCm8RHv9MB3xNyTE42H7KJWHNaGYP1UnSSj047NznOO.s5OuGr
 zQcC5OpZtwvArnhJCMWl6dcv5lv3_rRdXpZ4PlVX_48xmKmEfXZnDLU.0GATKZdu69mr1vhiqTDF
 T.gC1gz3AlWtTyJJf402Sl0HkTU5mftsxpBQs1HIPIskj..8VRq2bI6UwANXFm2Fva9RUpFUZqiR
 Nk62zlD2RU7HcWB6wb8KwJB69IDo35eA8fQRqsyeDjLXQeWxqtzwuCJtxch1LrXJ6c7vVQQZsD.r
 TJ2c_W8Pl.hbkv_9V_gNQ9kSO8eG0agaJ6CMbUujPCJ__SaEpfEzONnPzgZM_N5uLebP0XB71GE.
 uJZpLmQfoMK0fLycYKZuKttzi7yXHD.fokfYGW_JHHwuCzNIKr0e7CD_4Ol.pre8yWZK7FqvxQI5
 flZ65KpJ9mP.Yidr4Ht0aDPVwII3uGuKNAK9vIUznsOCWYyw.TFfzRNcFiPVpzE_Gqcybrfa8kkC
 uY9ojGSt9iDcD5WgKrbb4D._8pWQvS4w0YIrr1ejnKzF3tcYFaAHjUNaoY4oap4cMKi2sK4yF_ZP
 tngTt.FxTQ_ziOivonUE39sdMNfXUAVvIqpFLR0MLCijaIQLsm5wW1f1b3E6MCrYpKI1XXl7thP0
 PpKjH_ZtJpmWVv7Bt.uXNnMzK85Y7kRCGNVGNzMqlzqRiNh3lZU2210TrefxpFgGCUxx_BigZoKQ
 ivG1PxamQDAyYi2I8JebUnMwfmbvk211PrabLb0cTwvHFso39wkSAF.eSL1cLnp430cvJYr2sZgK
 GGshvts_lDo3bZW3ZHRhNRuQL.BkJXqkfE1TM0ZiCLZM_2DrUspiyrm7QhfdIlcil4V0f7ZnyzzN
 wSA06afW4pXnDTFekb6nU2u4wDvpw9AuJdgQHSHxLWkIZlbCXzmmqfpcB9yDLWe4JFQsdPTVTc5Q
 zBzVLVXjklxrbeKsAvhMXqxD7xl3xYI3CY7uqjitPU3H_zeSuYO2nQ.tz6f7hcr982evGjUhAa15
 sb.WLk8gW_1GZEAGs1xi5odrSw7FscMiAFZA0B4X1IiJJOMkCJHaPmkUEcIf2NjYnPLudEXyUyvV
 k0JVCKib8JUk.E9JkoFtSpb4r6OvRfrsqRozIKUxmivECD4ZghQMuwDKSg4q4M27gKzBUwl6xeU5
 cxVYJUG.P46vLj0sRTX1aLVZQH53_ziRD_.7lrM0-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Thu, 5 Nov 2020 22:41:41 +0000
Date:   Thu, 5 Nov 2020 22:41:40 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <64543235.428679.1604616100719@mail.yahoo.com>
Subject: BUSINESS CO-OPERATION.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <64543235.428679.1604616100719.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16944 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
